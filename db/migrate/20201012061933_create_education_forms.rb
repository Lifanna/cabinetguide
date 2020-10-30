class CreateEducationForms < ActiveRecord::Migration[5.1]
  def change
    create_table :education_forms do |t|
      t.string :name
      t.boolean :isDeleted

      t.timestamps
    end
  end
end
