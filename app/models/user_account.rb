class UserAccount < ApplicationRecord

  has_many :user_account_records, :dependent => :destroy
  belongs_to :user

  def self.find_or_create_for(user_id)
    account= UserAccount.find_by_user_id(user_id)
    if account.nil?
      account = UserAccount.new
      account.user_id=user_id
      account.save!
    end
    account
  end


end
