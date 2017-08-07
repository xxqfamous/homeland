class AddVisitLogStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :visit_logs, :status, :integer, :default => 0
    add_column :visit_logs, :deal_uid, :integer
    add_column :visit_logs, :deal_name, :string
    add_column :visit_logs, :deal_at, :datetime

  end
end
