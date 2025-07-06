require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'ユーザー新規登録' do
    context '新規登録が成功する' do
      it '内容に問題ない場合' do
        expect(user).to be_valid
      end
    end

    context '新規登録が失敗する' do
      it 'name（ユーザーネーム）が空のとき' do
        user.name = ''
        user.valid?
        expect(user.errors).to be_added(:name, :blank)
      end

      it 'name（ユーザーネーム）が256文字以上のとき' do
        user.name = 'a' * 256
        user.valid?
        expect(user.errors).to be_added(:name, :too_long, count: 255)
      end

      it 'email（メールアドレス）が空のとき' do
        user.email = ''
        user.valid?
        expect(user.errors).to be_added(:email, :blank)
      end

      it '重複したemailが存在する場合登録できない' do
        user.save
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'password（パスワード）が空のとき' do
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'password（パスワード）が5文字以下のとき' do
        user.password = 'abcde'
        user.valid?
        expect(user.errors).to be_added(:password, :too_short, count: 6)
      end

      it 'password_confirmation（パスワード確認）が空のとき' do
        user.password_confirmation = ''
        user.valid?
        expect(user.errors).to be_added(:password_confirmation, :blank)
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        user.password = 'abcdef'
        user.password_confirmation = ''
        user.valid?
        expect(user.errors).to be_added(:password_confirmation, :confirmation, attribute: "パスワード")
      end

      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        user.password = 'abcdef'
        user.password_confirmation = '123456'
        user.valid?
        expect(user.errors).to be_added(:password_confirmation, :confirmation, attribute: "パスワード")
      end
    end
  end
end