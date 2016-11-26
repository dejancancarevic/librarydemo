class Role < ApplicationRecord

  has_many :user_roles, dependent: :destroy
  has_many :users, -> { distinct }, through: :user_roles
  has_and_belongs_to_many :grants, join_table: :role_grants

  before_destroy { grants.clear }

end
