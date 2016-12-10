1.upto(5) do |idx|
  Box.create!(
    capacity: idx * 10,
    box_type: "タイプ#{idx}",
    price: idx * 100
  )
end
