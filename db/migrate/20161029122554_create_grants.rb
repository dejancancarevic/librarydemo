class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.references :grant_group
      t.string :name, limit: 255, index: { unique: true }
      t.string :action
      t.string :subject_class
      t.string :filters
      t.text :description
      t.timestamps
    end
  end
end
