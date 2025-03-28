require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      post = build(:post)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end

    it 'titleがない場合にバリデーションが機能してinvalidになるか' do
      post_without_title = build(:post, title: nil)
      expect(post_without_title).to be_invalid
      expect(post_without_title.errors.full_messages_for(:title)).to eq ["タイトルを入力してください"]
    end
    
    it 'crossing_imageがない場合にバリデーションが機能してinvalidになるか' do
      post_without_crossing_image = build(:post, crossing_image: nil)
      expect(post_without_crossing_image).to be_invalid
      expect(post_without_crossing_image.errors.full_messages_for(:crossing_image)).to eq ["フミキリフォトをアップロードしてください"]
    end
  end
end
