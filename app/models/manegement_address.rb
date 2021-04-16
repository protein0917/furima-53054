class ManegementAddress
  include ActiveModel::Model
  attr_accessor :city, :post_code, :shipping_area_id, :house_number, :building_name, :phone_number, :manegement_id, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :city
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    manegement = Manegement.create(item_id: item_id, user_id: user_id)

    Adress.create(city: city, post_code: post_code, shipping_area_id: shipping_area_id, house_number: house_number, building_name: building_name, phone_number: phone_number, manegement_id: manegement.id)
  end

end