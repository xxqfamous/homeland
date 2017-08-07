class VisitLog < ApplicationRecord

  belongs_to :user
  belongs_to :ownerable, :polymorphic => true

  has_many :user_account_records, :as => :ownerable, :dependent => :destroy


  def ownerable
    self.ownerable_type.camelize.constantize.find(self.ownerable_id)
  end

end
