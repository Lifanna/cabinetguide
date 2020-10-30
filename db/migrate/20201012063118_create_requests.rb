class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :institution_id
      t.integer :education_program_id
      t.integer :department_id
      t.integer :education_form_id
      t.integer :language_id
      t.integer :subject_id
      t.text :question
      t.boolean :isDeleted

      t.timestamps
    end
    
    add_foreign_key :requests, :users, column: :user_id
    add_foreign_key :requests, :institutions, column: :institution_id
    add_foreign_key :requests, :education_programs, column: :education_program_id
    add_foreign_key :requests, :departments, column: :department_id
    add_foreign_key :requests, :education_forms, column: :education_form_id
    add_foreign_key :requests, :languages, column: :language_id
    add_foreign_key :requests, :subjects, column: :subject_id

    # add_index :requests, [:username, :group_id], unique: true
  end
end
