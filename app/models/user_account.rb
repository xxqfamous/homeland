class UserAccount < ApplicationRecord

  has_many :user_account_records, :dependent => :destroy
  belongs_to :user


  def self.init_account(user_id)
    account = UserAccount.new
    account.user_id=user_id
    account.save!
    account
  end

end
