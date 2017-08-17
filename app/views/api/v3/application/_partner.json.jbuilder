# @class partnerSerializer
# 广告商
#
# == attributes
# - *id* [Integer] 编号
# - *name* [String] 节点名称
# - *sort* {Integer} 排序优先级
# - *updated_at* [DateTime] 更新时间
if partner
  json.(partner, :id, :logo_url, :name, :company, :reward_amount, :sort, :hot, :status, :year_rate, :time_limit , :invest_condition ,:reward_button)

  json.logo_url partner.logo_url.url
  json.banner_url partner.banner_url.url
  json.created_at partner.created_at.localtime.to_s(:db)
  json.updated_at partner.updated_at.localtime.to_s(:db)
end
