require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:user) { create(:user) }
  let(:railway) { create(:railway) }
  let(:crossing) do
    crossing = create(:crossing)
    create(:crossing_railway, crossing: crossing, railway: railway)  # ← ここで関連付け
    crossing
  end
  let(:post) { create(:post, user: user, crossing: crossing) }

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context '踏切の新規投稿ページにアクセス' do
        it '新規投稿ページへのアクセスが失敗する' do
          visit new_crossing_post_path(crossing.crossing_id)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '踏切投稿の編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_crossing_post_path(post.crossing_id, post.id)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '踏切投稿の詳細ページにアクセス' do
        it '踏切投稿の詳細情報が表示される' do
          visit crossing_post_path(post.crossing_id, post.id)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context 'タスクの一覧ページにアクセス' do
        it 'すべてのユーザーのタスク情報が表示される' do
          post_list = create_list(:post, 3)
          visit posts_path
          expect(page).to have_content post_list[0].title
          expect(page).to have_content post_list[1].title
          expect(page).to have_content post_list[2].title
          expect(current_path).to eq posts_path
        end
      end

    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe '踏切投稿の新規作成' do
      context 'フォームの入力値が正常' do
        it '踏切投稿の新規作成が成功する' do
          visit new_crossing_post_path(crossing.crossing_id)
          fill_in 'タイトル', with: 'new_post'
          fill_in '本文', with: 'new_body'
          fill_in 'タグ', with: 'new'
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '登録'
          expect(page).to have_content '投稿を作成しました'
          expect(page).to have_content 'new_post'
          expect(page).to have_css("img")
          expect(current_path).to eq crossing_path(crossing.crossing_id)
        end
      end

      context '本文が未入力' do
        it '踏切投稿の新規作成が成功する' do
          visit new_crossing_post_path(crossing.crossing_id)
          fill_in 'タイトル', with: 'new_post'
          fill_in '本文', with: ''
          fill_in 'タグ', with: 'new'
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '登録'
          expect(page).to have_content '投稿を作成しました'
          expect(page).to have_content 'new_post'
          expect(page).to have_css("img")
          expect(current_path).to eq crossing_path(crossing.crossing_id)
        end
      end

      context 'タグが未入力' do
        it '踏切投稿の新規作成が成功する' do
          visit new_crossing_post_path(crossing.crossing_id)
          fill_in 'タイトル', with: 'new_post'
          fill_in '本文', with: 'new_body'
          fill_in 'タグ', with: ''
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '登録'
          expect(page).to have_content '投稿を作成しました'
          expect(page).to have_content 'new_post'
          expect(page).to have_css("img")
          expect(current_path).to eq crossing_path(crossing.crossing_id)
        end
      end

      context 'タイトルが未入力' do
        it '踏切投稿の新規作成が失敗する' do
          visit new_crossing_post_path(crossing.crossing_id)
          fill_in 'タイトル', with: ''
          fill_in '本文', with: 'new_body'
          fill_in 'タグ', with: 'new'
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '登録'
          expect(page).to have_content 'タイトルを入力してください'
          expect(page).to have_content "投稿を作成できませんでした"
          expect(current_path).to eq new_crossing_post_path(crossing.crossing_id)
        end
      end

      context 'フミキリフォトが未選択' do
        it '踏切投稿の新規作成が失敗する' do
          visit new_crossing_post_path(crossing.crossing_id)
          fill_in 'タイトル', with: 'new_title'
          fill_in '本文', with: 'new_body'
          fill_in 'タグ', with: 'new'
          click_button '登録'
          expect(page).to have_content 'フミキリフォトをアップロードしてください'
          expect(page).to have_content "投稿を作成できませんでした"
          expect(current_path).to eq new_crossing_post_path(crossing.crossing_id)
        end
      end

    end

    describe '踏切投稿の編集' do
      context 'フォームの入力値が正常' do
        it '踏切投稿の編集が成功する' do
          visit edit_crossing_post_path(post.crossing_id, post.id)
          fill_in 'タイトル', with: 'update_post'
          fill_in '本文', with: 'update_body'
          fill_in 'タグ', with: 'update'
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '更新'
          expect(page).to have_content '投稿を更新しました'
          expect(page).to have_content 'update_post'
          expect(page).to have_css("img")
          expect(current_path).to eq crossing_post_path(crossing, post)
        end
      end

      context '本文が未入力' do
        it '踏切投稿の編集が成功する' do
          visit edit_crossing_post_path(post.crossing_id, post.id)
          fill_in 'タイトル', with: 'update_post'
          fill_in '本文', with: ''
          fill_in 'タグ', with: 'update'
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '更新'
          expect(page).to have_content '投稿を更新しました'
          expect(page).to have_content 'update_post'
          expect(page).to have_css("img")
          expect(current_path).to eq crossing_post_path(crossing, post)
        end
      end

      context 'タグが未入力' do
        it '踏切投稿の編集が成功する' do
          visit edit_crossing_post_path(post.crossing_id, post.id)
          fill_in 'タイトル', with: 'update_post'
          fill_in '本文', with: 'update_body'
          fill_in 'タグ', with: ''
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '更新'
          expect(page).to have_content '投稿を更新しました'
          expect(page).to have_content 'update_post'
          expect(page).to have_css("img")
          expect(current_path).to eq crossing_post_path(crossing, post)
        end
      end

      context 'タイトルが未入力' do
        it '踏切投稿の編集が失敗する' do
          visit edit_crossing_post_path(post.crossing_id, post.id)
          fill_in 'タイトル', with: ''
          fill_in '本文', with: 'update_body'
          fill_in 'タグ', with: 'update'
          attach_file 'フミキリフォト', Rails.root.join('spec/support/sample.jpg')
          click_button '更新'
          expect(page).to have_content 'タイトルを入力してください'
          expect(page).to have_content "投稿を更新できませんでした"
          expect(current_path).to eq edit_crossing_post_path(post.crossing_id, post.id)
        end
      end
    end

  end
end
