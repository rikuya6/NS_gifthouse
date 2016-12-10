Faker::Config.locale = :ja

1.upto(50) do |idx|
  Product.create!(
    name: Faker::Book.title + "#{idx}",
    price: idx * 100,
    weight: idx * 5,
    stock: idx,
    note: Faker::Lorem.paragraph
  )
end
