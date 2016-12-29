2.upto(3) do |idx|
  Rule.create!(
    category_id1: idx,
    category_id2: idx + 1
  )
end
