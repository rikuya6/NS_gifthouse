1.upto(2) do |idx|
  ProductCategory.create!(
    product_id: idx,
    category_id: 2
  )
end

3.upto(4) do |idx|
  ProductCategory.create!(
    product_id: idx,
    category_id: 3
  )
end
