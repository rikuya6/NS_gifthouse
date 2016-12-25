1.upto(20) do |idx|
  3.downto(1) do |k|
    ProductCategory.create!(
      product_id: idx,
      category_id: k
    )
  end
end
