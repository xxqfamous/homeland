class VisitLog < ApplicationRecord

  belongs_to :user
  belongs_to :ownerable, :polymorphic => true

  def ownerable
    self.ownerable_type.camelize.constantize.find(self.ownerable_id)
  end

end
