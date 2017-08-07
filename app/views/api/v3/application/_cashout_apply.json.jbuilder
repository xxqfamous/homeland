# @class AdvertiserSerializer
# 广告商
#
# == attributes
# - *id* [Integer] 编号
# - *name* [String] 节点名称
# - *sort* {Integer} 排序优先级
# - *updated_at* [DateTime] 更新时间
if cashout_apply
  json.(cashout_apply, :id, :amount, :cash_account, :cash_name, :status)

  json.action "提现"
  json.status_str cashout_apply.status==0 ? "审核中" : "审核通过"

  json.created_at cashout_apply.created_at.localtime.to_s(:db)
  json.updated_at cashout_apply.updated_at.localtime.to_s(:db)
end
