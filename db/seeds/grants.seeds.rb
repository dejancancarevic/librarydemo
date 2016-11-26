
%w(University Faculty StudentLibrary Book).each do |resource|

  grant_group = GrantGroup.find_or_create_by(name: "#{resource} grants")

  %w(index show update create destroy).each do |action|

    grant = Grant.create(name: "#{action.camelcase} #{resource}", action: action, subject_class: resource, description: "Can #{action} #{resource}")
    grant_group.grants << grant
    puts "Grant '#{action}' for #{resource} seeded successfully."

  end

end