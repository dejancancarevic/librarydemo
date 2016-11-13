["Librarian", "Student"].each do |name|
  Role.create(name: name)
  puts "Role #{name} seeded successfully."
end





