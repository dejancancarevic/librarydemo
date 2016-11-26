after :users, :roles do

  librarian_role = Role.find_by_name("Librarian")
  student_role   = Role.find_by_name("Student")

  university1 = University.find_by_name("University 0")
  university2 = University.find_by_name("University 1")
  university3 = University.find_by_name("University 2")

  # user0@email.com is set to be admin in Hogar init config

  # user1 Librarian for University 1 and Student for University 2. No access to University 3
  user1 = User.find_by_email("user1@email.com")
  UserRole.create(role_id: librarian_role.id, user_id: user1.id, context_type: "University", context_id: university1.id)
  UserRole.create(role_id: student_role.id, user_id: user1.id, context_type: "University", context_id: university2.id)
  puts "UserRoles for #{user1.email} seeded"

  # user2 Librarian for University 3
  user2 = User.find_by_email("user2@email.com")
  UserRole.create(role_id: librarian_role.id, user_id: user2.id, context_type: "University", context_id: university3.id)
  puts "UserRoles for #{user2.email} seeded"

  # user3 Student for University 1
  user3 = User.find_by_email("user3@email.com")
  UserRole.create(role_id: student_role.id, user_id: user3.id, context_type: "University", context_id: university1.id)
  puts "UserRoles for #{user3.email} seeded"

end

