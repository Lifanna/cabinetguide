class CreateEducationPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :education_programs do |t|
      t.string :name
      t.integer :education_form_id
      t.boolean :isDeleted

      t.timestamps
    end

    add_foreign_key :education_programs, :education_forms, column: :education_form_id
  end
end
