class AddAdvertiserCounter < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisers, :visits_count, :integer, :default => 0
  end
end
