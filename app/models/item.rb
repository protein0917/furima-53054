class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_free_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_free
  belongs_to :shipping_area
  belongs_to :shipping_day

  has_one_attached :image


end
