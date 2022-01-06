class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.float :amount
      t.datetime :goal_target_time

      t.timestamps
    end
  end
end
