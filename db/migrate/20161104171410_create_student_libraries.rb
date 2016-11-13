class CreateStudentLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :student_libraries do |t|
      t.references :faculty, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
