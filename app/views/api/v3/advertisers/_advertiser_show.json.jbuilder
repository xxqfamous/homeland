# @class AdvertiserSerializer
# 广告商
#
# == attributes
# - *id* [Integer] 编号
# - *name* [String] 节点名称
# - *sort* {Integer} 排序优先级
# - *updated_at* [DateTime] 更新时间
if advertiser
  json.(advertiser, :id, :name, :company, :company_info, :reward, :rule, :guide, :sort, :status)
  json.logo_url advertiser.logo_url.url
  json.banner_url advertiser.banner_url.url
  json.url "#{Setting.host}#{to_url_api_v3_advertiser_path(advertiser.id)}"
  json.created_at advertiser.created_at.localtime.to_s(:db)
  json.updated_at advertiser.updated_at.localtime.to_s(:db)
end
