class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.integer :group_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
