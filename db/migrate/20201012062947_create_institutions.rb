class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.integer :institution_type_id
      t.integer :city_id
      t.boolean :isDeleted

      t.timestamps
    end

    add_foreign_key :institutions, :institution_types, column: :institution_type_id
    add_foreign_key :institutions, :cities, column: :city_id
  end
end
