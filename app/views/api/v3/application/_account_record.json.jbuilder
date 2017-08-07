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
if account_record
  json.(account_record, :id)
  json.in_or_out_str account_record.in_or_out==1 ? "收入" : "支出"
  json.in_or_out account_record.in_or_out
  json.change_amount account_record.change_amount
  json.from_amount account_record.from_amount
  json.to_amount account_record.to_amount
  json.remark account_record.remark

  json.ownerable do
    if account_record.ownerable_type == "VisitLog"
      json.partial! "visit_log", visit_log: account_record.try(:ownerable)
    else
      json.partial! "cashout_apply", cashout_apply: account_record.try(:ownerable)
    end
  end

  json.created_at account_record.created_at.localtime.to_s(:db)
  json.updated_at account_record.updated_at.localtime.to_s(:db)


end
