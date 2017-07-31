class AddAdvertiserClm < ActiveRecord::Migration[5.1]
  def change
    change_column :advertisers, :reward_amount, :decimal
    add_column :advertisers, :year_rate, :string
    add_column :advertisers, :time_limit, :string
    add_column :advertisers, :invest_condition, :string

    change_column :user_account_records, :change_amount, :decimal
    change_column :user_account_records, :from_amount, :decimal
    change_column :user_account_records, :to_amount, :decimal

    add_column :user_accounts, :alipay_account, :string
    add_column :user_accounts, :alipay_name, :string

  end
end
