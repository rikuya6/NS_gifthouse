2.upto(10) do |idx|
  3.downto(2) do |k|
    ProductCategory.create!(
      product_id: idx,
      category_id: k
    )
  end
end
