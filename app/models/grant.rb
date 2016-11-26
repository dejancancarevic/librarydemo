class Grant < ApplicationRecord

  belongs_to :grant_group
  has_and_belongs_to_many :roles, join_table: :role_grants

  validates :name,
            presence: { message: "can't be blank" },
            uniqueness: { message: "already exists" }

  before_destroy { roles.clear }

end
