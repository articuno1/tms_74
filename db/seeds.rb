User.create!(fullname:  "Le Duc Duy",
  username: "leducduy",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

10.times do |n|
  fullname = Faker::Name.name
  username = "example#{n+1}"
  password = "password"
  role = "2"
  User.create!(fullname: fullname,
    username: username,
    password: password,
    password_confirmation: password,
    role: role)
end
