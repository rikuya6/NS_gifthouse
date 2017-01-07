Faker::Config.locale = :ja

pic_path = "#{Rails.root}/db/seeds/production/product1.png"

1.upto(5) do |idx|
  product = Product.new(
    name: Faker::Book.title + "#{idx}",
    price: idx * 100,
    weight: idx * 5,
    stock: idx,
    note: Faker::Lorem.paragraph,
    image: open(pic_path)
  )
end
