
ArUtil.available_models.each do |resource|

  grant_group = GrantGroup.find_or_create_by(name: "#{resource} grants")

  ArUtil.available_actions(resource).each do |action|

    grant = Grant.create(name: "#{action.camelcase} #{resource}", action: action, subject_class: resource, description: "Can #{action} #{resource}")
    grant_group.grants << grant
    puts "Grant '#{action}' for #{resource} seeded successfully."

  end

end