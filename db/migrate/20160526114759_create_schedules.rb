class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :mon
      t.text :tue
      t.text :wed
      t.text :thu
      t.text :fri
      t.text :sat
      t.text :sun
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
