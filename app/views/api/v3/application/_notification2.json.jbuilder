# 通知
# @class NotificationSerializer
#
# == attributes
# - *id* [Integer] 编号
# - *type* [String] 通知类型
# - *read* [Boolean] 是否已读
# - *actor* {UserSerializer} 动作发起者
# - *mention_type* [String] 提及的数据类型 Topic, Reply
# - *created_at* [DateTime] 创建时间
# - *updated_at* [DateTime] 更新时间
if notification
  json.(notification, :id)
  json.type notification.notify_type.classify
  json.read notification.read?
  json.notify_title notification.notify_head
  json.notify_content notification.notify_content
  json.created_at notification.created_at.localtime.to_s(:db)
  json.updated_at notification.updated_at.localtime.to_s(:db)


end
