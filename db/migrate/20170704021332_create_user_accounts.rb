class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.integer :user_id, null: false
      t.string :pay_password
      t.float :amount, :default => 0
      t.integer :status, :default => 1
      t.timestamps
    end

    add_index :user_accounts, :user_id
  end
end
