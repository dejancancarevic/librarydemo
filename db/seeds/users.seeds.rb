1..4.times do |a|
  User.create(email: "user#{a}@email.com", name: "Sample #{a}", password: "password", password_confirmation: "password")
end