class CashoutApply < ApplicationRecord


  validates :cash_account, :presence => true, :allow_blank => false
  validates :cash_name, :presence => true, :allow_blank => false
  validates :amount, :presence => true, :allow_blank => false

  has_many :user_account_records, :as => :ownerable, :dependent => :destroy

  belongs_to :user
end
