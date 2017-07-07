class CreateUserAccountRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_account_records do |t|
      t.integer :user_id, null: false
      t.integer :in_or_out
      t.float :change_amount
      t.float :from_amount
      t.float :to_amount
      t.string :ownerable_type
      t.integer :ownerable_id
      t.string :remark
      t.timestamps
    end

    add_index :user_account_records, :user_id
    add_index :user_account_records, :ownerable_type
    add_index :user_account_records, :ownerable_id
  end
end
