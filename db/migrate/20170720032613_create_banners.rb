class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :title
      t.integer :position
      t.string :img
      t.integer :sort
      t.string :href
      t.integer :status, default: 1
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
