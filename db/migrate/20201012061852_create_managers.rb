class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.string :name
      t.integer :department_id
      t.boolean :isDeleted

      t.timestamps
    end

    add_foreign_key :managers, :departments, column: :department_id
  end
end
