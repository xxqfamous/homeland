class CreateVisitLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :visit_logs do |t|
      t.integer :user_id
      t.string :ownerable_type
      t.integer :ownerable_id
      t.float :reward_amount, :default => 0
      t.timestamps
    end

    add_index :visit_logs, :user_id
    add_index :visit_logs, :ownerable_type
    add_index :visit_logs, :ownerable_id
  end
end
