class NotifyUserAccountJob < ApplicationJob
  queue_as :notifications

  def perform(record_id)
    UserAccountRecord.notify_user_account_changed(record_id)
  end
end
