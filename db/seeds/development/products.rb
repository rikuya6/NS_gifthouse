Faker::Config.locale = :ja


path = Rails.root.join('db/seeds/development', "product1.png")
file = Rack::Test::UploadedFile.new(path, 'image/x-png', true)
1.upto(50) do |idx|
  Product.create!(
    name: Faker::Book.title + "#{idx}",
    price: idx * 100,
    weight: idx * 5,
    stock: idx,
    note: Faker::Lorem.paragraph,
    uploaded_image: file
  )
end
