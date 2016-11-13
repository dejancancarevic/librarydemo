class StudentLibrary < ApplicationRecord
  has_many :books
  belongs_to :faculty
end
