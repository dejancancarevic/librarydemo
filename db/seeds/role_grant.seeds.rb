after :grants, :roles do

  # @param Role obj
  # @param String resource
  # @param Array only actions
  # @param Array exclude actions
  def add_role_grants(role, resource, only = [], exclude = [])
    all_actions = %w(index show update create destroy)
    actions = (only and only.any?) ? only : all_actions - exclude
    actions.each do |action|
      grant = Grant.find_by_name("#{action.camelcase} #{resource}")
      if grant
        role.grants << grant
        puts "Added #{action.capitalize} #{resource} to #{role.name}"
      else
        puts "no grant found #{resource} to #{role.name}"
      end
    end
  end

  librarian_role = Role.find_by_name("Librarian")
  student_role   = Role.find_by_name("Student")

  # Librarian

  add_role_grants(librarian_role, "University", ["index", "show"])
  add_role_grants(librarian_role, "Faculty", ["index", "show"])
  add_role_grants(librarian_role, "StudentLibrary")
  add_role_grants(librarian_role, "Book")

  add_role_grants(student_role, "University", ["index", "show"])
  add_role_grants(student_role, "Faculty", ["index", "show"])
  add_role_grants(student_role, "StudentLibrary", ["index", "show"])
  add_role_grants(student_role, "Book", ["index", "show"])

end

