class UserRole < ApplicationRecord

  # Relations
  belongs_to :user
  belongs_to :role
  belongs_to :context, polymorphic: true

  validates_numericality_of :user_id, :role_id, :context_id, allow_nil: false, only_integer: true, :message => "can only be whole number and not blank."
  validates :context_type, presence: { message: "can't be blank" }

end
