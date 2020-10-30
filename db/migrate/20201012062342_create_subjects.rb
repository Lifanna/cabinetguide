class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :institution_type_id
      t.boolean :isDeleted

      t.timestamps
    end

    add_foreign_key :subjects, :institution_types, column: :institution_type_id
  end
end
