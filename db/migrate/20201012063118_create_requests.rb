class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :institution_id, :default => 1
      t.integer :education_program_id, :default => 1
      t.integer :department_id, :default => 30
      t.integer :education_form_id, :default => 7
      t.integer :language_id, :default => 2
      t.integer :subject_id, :default => 1
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
