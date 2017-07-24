class ChangeAmountColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :cashout_applies, :amount, :decimal
    change_column :user_accounts, :amount, :decimal
  end
end
