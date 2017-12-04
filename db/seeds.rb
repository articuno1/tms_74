User.create!(fullname:  "Le Duc Duy",
  username: "leducduy",
  password: "123456",
  password_confirmation: "123456")

10.times do |n|
  fullname = Faker::Name.name
  username = "example#{n+1}"
  password = "password"
  User.create!(fullname: fullname,
    username: username,
    password: password,
    password_confirmation: password)
end
