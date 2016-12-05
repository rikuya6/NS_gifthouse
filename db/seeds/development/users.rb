User.create(
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  administrator: true
)

0.upto(9) do |idx|
  User.create(
    email: "#{idx}@test.com",
    password: 'password',
    password_confirmation: 'password'
  )
end
