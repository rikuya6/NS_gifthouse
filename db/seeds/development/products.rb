1.upto(20) do |idx|
  Product.create(
    name: "商品#{idx}",
    price: idx * 100,
    weight: idx * 5,
    stock: idx,
    note: "商品説明です"
  )
end
