Faker::Config.locale = :ja

pic_path = Rails.root.join('db/seeds/development', "product1.png")

1.upto(5) do |idx|
  product = Product.new(
    name: Faker::Book.title + "#{idx}",
    price: idx * 100,
    weight: idx * 5,
    stock: idx,
    note: Faker::Lorem.paragraph,
    image: pic_path
  )
end
