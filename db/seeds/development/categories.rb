1.upto(20) do |idx|
  Category.create!(
    name: Faker::GameOfThrones.house + "#{idx}"
  )
end
