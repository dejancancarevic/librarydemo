class GrantGroup < ApplicationRecord

  has_many :grants

  validates :name,
            presence: { message: "can't be blank" },
            uniqueness: { message: "already exists" }

end
