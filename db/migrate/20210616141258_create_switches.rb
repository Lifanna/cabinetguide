class CreateSwitches < ActiveRecord::Migration[5.1]
  def change
    create_table :switches do |t|
      t.boolean :is_active

      t.timestamps
    end
  end
end
