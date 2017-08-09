class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :logo_url
      t.string :banner_url
      t.string :company
      t.text :reward
      t.text :rule
      t.text :company_info
      t.text :guide
      t.integer :status, default: 1
      t.integer :sort, default: 0
      t.integer :hot, default: 0
      t.decimal :reward_amount, default: 0
      t.string :url
      t.string :download_url
      t.string :year_rate
      t.string :time_limit
      t.string :invest_condition
      t.integer :visits_count, default: 0
      t.timestamps
    end
  end
end
