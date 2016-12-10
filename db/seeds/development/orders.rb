Faker::Config.locale = :ja

users = User.all.order(:created_at)
users.each do |user|
  1.upto(3) do |order_idx|
    order = user.orders.create!(
      product_id: order_idx,
      wrapping_id: order_idx
    )
    dest = Faker::Address.city
    dest += Faker::Address.street_name
    dest += Faker::Address.street_name
    order.addresses.create!(
      dest: "ユーザID:#{user.id} " + dest,
      zipcode: "ユーザID:#{user.id} " + Faker::Address.zip_code
    )
  end
end
