class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :shipping_id
    validates :shipping_day_id
  end
end
