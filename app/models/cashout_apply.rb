class CashoutApply < ApplicationRecord


  validates :cash_account, :presence => true, :allow_blank => false
  validates :cash_name, :presence => true, :allow_blank => false
  validates :amount, :presence => true, :allow_blank => false

  belongs_to :user
end
