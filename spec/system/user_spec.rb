require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザー新規登録が成功する' do
          visit new_user_path
          fill_in 'ユーザーネーム', with: 'new_name'
          fill_in 'メールアドレス', with: 'new@example.com'
          fill_in 'パスワード', with: 'password1234'
          fill_in 'パスワード確認', with: 'password1234'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録が完了しました'
          expect(current_path).to eq login_path
        end
      end

      context 'ユーザーネームが未入力' do
        it 'ユーザー新規登録が失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム', with: ''
          fill_in 'メールアドレス', with: 'test1@example.com'
          fill_in 'パスワード', with: 'password1234'
          fill_in 'パスワード確認', with: 'password1234'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content "ユーザーネームを入力してください"
          expect(current_path).to eq new_user_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザー新規登録が失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム', with: 'test_name1'
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password1234'
          fill_in 'パスワード確認', with: 'password1234'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content "メールアドレスを入力してください"
          expect(current_path).to eq new_user_path
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザー新規登録が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in 'ユーザーネーム', with: 'test_name1'
          fill_in 'メールアドレス', with: existed_user.email
          fill_in 'パスワード', with: 'password1234'
          fill_in 'パスワード確認', with: 'password1234'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).to eq new_user_path
          expect(page).to have_field 'メールアドレス', with: existed_user.email
        end
      end

      context 'パスワードが6文字未満' do
        it 'ユーザー新規登録が失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム', with: 'test_name1'
          fill_in 'メールアドレス', with: 'test1@example.com'
          fill_in 'パスワード', with: '12345'
          fill_in 'パスワード確認', with: '12345'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'パスワードは6文字以上で入力してください'
          expect(current_path).to eq new_user_path
        end
      end

      context 'パスワードとパスワード確認が一致しない' do
        it 'ユーザー新規登録が失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム', with: 'test_name1'
          fill_in 'メールアドレス', with: 'test1@example.com'
          fill_in 'パスワード', with: 'password1234'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'
          expect(current_path).to eq new_user_path
        end
      end

      it 'エラー後も入力したメールアドレスが保持される' do
        visit new_user_path
        fill_in 'ユーザーネーム', with: 'test_name'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password1234'
        fill_in 'パスワード確認', with: ''
        click_button '登録'
        expect(page).to have_field('メールアドレス', with: 'test@example.com')
      end
    end

    describe 'マイページ' do
      context 'ログインしていない状態' do
        it 'マイページへのアクセスが失敗する' do
          visit profile_path
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end
    end

    describe 'ログイン' do
      it '正しいメール・パスワードでログイン成功' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password1234'
        find("input.btn-warning[value='ログイン']").click
        expect(page).to have_current_path(root_path, wait: 5)
        expect(page).to have_content('ログインしました')
      end

      it '間違ったパスワードでログイン失敗' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'wrongpassword'
        find("#login-btn").click
        expect(page).to have_current_path(login_path, wait: 5)
        expect(page).to have_content('メールアドレスまたはパスワードが間違っています', wait: 5)
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          visit edit_profile_path
          fill_in 'ユーザーネーム', with: 'update_name'
          fill_in 'メールアドレス', with: 'update@example.com'
          click_button '変更'
          expect(page).to have_content('プロフィールを更新しました', wait: 5)
          expect(current_path).to eq profile_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_profile_path
          fill_in 'ユーザーネーム', with: 'update_name'
          fill_in 'メールアドレス', with: ''
          click_button '変更'
          expect(current_path).to eq edit_profile_path
          expect(page).to have_content('メールアドレスを入力してください', wait: 5)
          expect(page).to have_content('プロフィールを更新できませんでした', wait: 5)
        end
      end

      context 'ユーザーネームが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_profile_path
          fill_in 'ユーザーネーム', with: ''
          fill_in 'メールアドレス', with: 'update@example.com'
          click_button '変更'
          expect(current_path).to eq edit_profile_path
          expect(page).to have_content('ユーザーネームを入力してください', wait: 5)
          expect(page).to have_content('プロフィールを更新できませんでした', wait: 5)
        end
      end

      it 'ログアウトできる' do
        click_link 'ログアウト'
        expect(page).to have_content('ログアウトしました')
        expect(current_path).to eq root_path
      end
    end

  end

end