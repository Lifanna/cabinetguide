class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :region_id
      t.boolean :isDeleted

      t.timestamps
    end
    
    add_foreign_key :cities, :regions, column: :region_id
  end
end
