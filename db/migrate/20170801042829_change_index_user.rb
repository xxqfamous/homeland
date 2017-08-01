class ChangeIndexUser < ActiveRecord::Migration[5.1]
  def change
    remove_index :user_accounts, :user_id
    add_index :user_accounts, :user_id, unique: true

    change_column :visit_logs, :reward_amount, :decimal

  end
end
