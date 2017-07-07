class VisitLogJob < ApplicationJob
  queue_as :visit_log_job

  # user_id: 用户ID
  # reward_amount: 奖励
  # ownerable_id, ownerable_type --source from
  def perform(user_id, reward_amount, ownerable_id, ownerable_type)
    # obj = ownerable_type.camelize.constantize.find(ownerable_id)
    # if !obj.nil?
    #   model = obj.visit_logs.new
    #   model.user_id=user_id
    #   model.save!
    # end
    VisitLog.new(:user_id => user_id, :reward_amount => reward_amount, :ownerable_id => ownerable_id, :ownerable_type => ownerable_type).save!
  end
end
