class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
    validates :condition_id
    validates :shipping_free_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :category_id
  end

  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :shipping_free_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :category_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_free
  belongs_to :shipping_area
  belongs_to :shipping_day

  has_one_attached :image


end
