1.upto(20) do |idx|
  Category.create(
    name: "カテゴリ#{idx}",
  )
end
