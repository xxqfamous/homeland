class UserAccountRecord < ApplicationRecord

  belongs_to :user_account
  # has_many :user_account_records, :dependent => :destroy
  belongs_to :user
  belongs_to :ownerable, :polymorphic => true


  def ownerable
    self.ownerable_type.camelize.constantize.find(self.ownerable_id)
  end

  after_commit :async_change_account

  def async_change_account
    NotifyUserAccountJob.perform_later(id)
  end



  def self.add_record(user_id, in_or_out, change, from, to)
    accountRecord = UserAccountRecord.new
    accountRecord.user_id=user_id
    accountRecord.save!
  end

  def default_notification
    @default_notification ||= {
        notify_type: "user_account_record",
        target_type: "UserAccountRecord",
        target_id: self.id,
        # second_target_type: "",
        # second_target_id: self.id,
        actor_id: self.user_id
    }
  end

  def self.notify_user_account_changed(record_id)
    record = UserAccountRecord.find_by_id(record_id)
    return if record.blank?
    return if record.ownerable.blank?

    Notification.bulk_insert(set_size: 100) do |worker|
      note = record.default_notification.merge(user_id: record.user_id)
      worker.add(note)
    end
    true
  end
end
