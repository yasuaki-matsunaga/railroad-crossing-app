class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, format: { with: /\A[a-zA-Z0-9]{6,}\z/, message: 'は半角英数字で6文字以上にしてください' }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :crossing_favorites, dependent: :destroy
  has_many :favorite_crossings, through: :crossing_favorites, source: :crossing

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  mount_uploader :avatar, AvatarUploader

  def own?(object)
    id == object&.user_id
  end

  def favorite(post)
    favorite_posts << post
  end

  def unfavorite(post)
    favorite_posts.delete(post)
  end

  def favorite?(post)
    favorite_posts.include?(post)
  end

  def crossing_favorite(crossing)
    favorite_crossings << crossing
  end

  def crossing_unfavorite(crossing)
    favorite_crossings.delete(crossing)
  end

  def crossing_favorite?(crossing)
    favorite_crossings.include?(crossing)
  end
end
