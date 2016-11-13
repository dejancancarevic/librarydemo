class CreateRoleGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :role_grants do |t|
      t.references :role, foreign_key: { on_delete: :cascade }
      t.references :grant, foreign_key: { on_delete: :cascade }
    end
  end
end
