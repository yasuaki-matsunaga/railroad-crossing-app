class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(auth_object = nil)
    # 全ての列を検索可能にする
    authorizable_ransackable_attributes
  end
  def self.ransackable_associations(auth_object = nil)
    # 全ての関連テーブルを検索可能にする
    authorizable_ransackable_associations
  end
end
