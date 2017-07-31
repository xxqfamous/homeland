class UserAccountRecord < ApplicationRecord

  belongs_to :user_account
  # has_many :user_account_records, :dependent => :destroy
  belongs_to :user
  belongs_to :ownerable, :polymorphic => true


  def ownerable
    self.ownerable_type.camelize.constantize.find(self.ownerable_id)
  end


  def self.add_record(user_id,in_or_out,change,from,to)
    accountRecord = UserAccountRecord.new
    accountRecord.user_id=user_id
    accountRecord.save!
  end
end
