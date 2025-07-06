require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションチェック' do
    let(:post) { build(:post) }

    it '設定したすべてのバリデーションが機能しているか' do
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end

    it 'titleがない場合にバリデーションが機能してinvalidになるか' do
      post.title = nil
      expect(post).to be_invalid
      expect(post.errors.full_messages_for(:title)).to eq ["タイトルを入力してください"]
    end
    
    it 'titleが255文字を超えるとinvalidになるか' do
      post.title = 'あ' * 256
      expect(post).to be_invalid
      expect(post.errors.full_messages_for(:title)).to eq ["タイトルは255文字以内で入力してください"]
    end

    it 'bodyが65535文字を超えるとinvalidになる' do
      post.body = 'あ' * 65_536
      expect(post).to be_invalid
      expect(post.errors.full_messages_for(:body)).to eq ["本文は65535文字以内で入力してください"]
    end

    it 'crossing_imageがない場合にバリデーションが機能してinvalidになるか' do
      post.crossing_image = nil
      expect(post).to be_invalid
      expect(post.errors.full_messages_for(:crossing_image)).to eq ["フミキリフォトをアップロードしてください"]
    end
  end

  describe 'その他機能チェック' do
    it '#favorited_by? がそのユーザーのお気に入り状態を正しく返すこと' do
      user = create(:user)
      post = create(:post)
      expect(post.favorited_by?(user)).to be_falsey

      post.favorites.create(user: user)
      expect(post.favorited_by?(user)).to be_truthy
    end

    it 'タグを複数付けられること' do
      post = create(:post, tag_list: ['遮断機', '音'])
      expect(post.tag_list).to match_array(['遮断機', '音'])
    end

    it 'crossing_imageにUploaderがマウントされていること' do
      expect(Post.uploaders[:crossing_image]).to eq CrossingImageUploader
    end
  end
end
