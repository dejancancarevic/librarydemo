class Faculty < ApplicationRecord
  has_many :student_libraries
  belongs_to :university
end
