class CreateCashoutApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :cashout_applies do |t|
      t.integer :user_id
      t.float :amount, default: 0
      t.string :cash_account
      t.string :cash_name
      t.integer :status
      t.integer :deal_uid
      t.string :deal_name
      t.datetime :deal_at
      t.string :remark
      t.timestamps
    end

    add_index :cashout_applies, :user_id
    add_index :cashout_applies, :status
  end
end
