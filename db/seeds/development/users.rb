User.create(
  email: 'admin@test.com',
  password: 'password',
  password_confirmation: 'password',
  administrator: true
)

1.upto(100) do |idx|
  User.create(
    email: "user#{idx}@test.com",
    password: 'password',
    password_confirmation: 'password'
  )
end
