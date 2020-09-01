class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :set_up_time
  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :postage
    validates :prefecture
    validates :set_up_time
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :set_up_time_id
  end
end
