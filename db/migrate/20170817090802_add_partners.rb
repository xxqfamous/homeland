class AddPartners < ActiveRecord::Migration[5.1]
  def change
    add_column :partners, :reward_button, :string
  end
end
