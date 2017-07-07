class CreateAdvertisers < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisers do |t|
      t.string :name
      t.string :logo_url
      t.string :banner_url
      t.string :company
      t.text :reward
      t.text :rule
      t.text :company_info
      t.text :guide
      t.integer :status, default: 1
      t.integer :sort
      t.float :reward_amount, default: 0
      t.string :url
      t.string :download_url
      t.timestamps
    end


    add_index :advertisers, :name, unique: true
    add_index :advertisers, :status
  end
end
