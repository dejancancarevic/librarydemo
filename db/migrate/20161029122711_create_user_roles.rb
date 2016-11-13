class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.references :role, foreign_key: { on_delete: :cascade }
      t.references :user, foreign_key: { on_delete: :cascade }
      t.string  :context_type, null: false
      t.integer :context_id, null: false,  foreign_key: false
      t.timestamps
    end
  end
end
