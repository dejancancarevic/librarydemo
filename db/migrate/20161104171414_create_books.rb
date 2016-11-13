class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :student_library, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
