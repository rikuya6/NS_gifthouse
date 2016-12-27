Category.create!(
  name: 'ギフトボックス'
)

1.upto(10) do |idx|
  Category.create!(
    name: Faker::GameOfThrones.house + "#{idx}"
  )
end
