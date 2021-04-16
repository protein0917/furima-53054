class Manegement < ApplicationRecord

  belongs_to :item
  belongs_to :user
  has_one :adress


end
