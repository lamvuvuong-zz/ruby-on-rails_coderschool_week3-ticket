class CreateOptionEvents < ActiveRecord::Migration
  def change
    create_table :option_events do |t|
      t.integer :checked
      t.integer :event

      t.timestamps null: false
    end
  end
end
