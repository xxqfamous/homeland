# @class AdvertiserSerializer
# 广告商
#
# == attributes
# - *id* [Integer] 编号
# - *name* [String] 节点名称
# - *sort* {Integer} 排序优先级
# - *updated_at* [DateTime] 更新时间
if advertiser
  json.(advertiser, :id, :logo_url, :name, :company, :reward_amount, :sort, :status)

  json.logo_url advertiser.logo_url.url
  json.banner_url advertiser.banner_url.url
  json.created_at advertiser.created_at.localtime.to_s(:db)
  json.updated_at advertiser.updated_at.localtime.to_s(:db)
end
