# @class visit_log
# 收入明细
#
# == attributes
# - *id* [Integer] 编号
# - *reward_amount* [String] 节点名称
# - *from* {Integer} 排序优先级
# - *action* [DateTime] 更新时间
if visit_log
  json.(visit_log, :id)

  json.amount visit_log.reward_amount
  json.from visit_log.ownerable.try(:name)
  json.action "奖励"

  json.created_at visit_log.created_at.localtime.to_s(:db)
  json.updated_at visit_log.updated_at.localtime.to_s(:db)
end
