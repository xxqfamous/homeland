# @class partnerSerializer
# 广告商
#
# == attributes
# - *id* [Integer] 编号
# - *name* [String] 节点名称
# - *sort* {Integer} 排序优先级
# - *updated_at* [DateTime] 更新时间
if partner
  json.(partner, :id, :name, :company, :company_info, :reward, :rule, :guide, :sort, :hot, :status)
  json.logo_url partner.logo_url.url
  json.banner_url partner.banner_url.url
  json.url "#{Setting.host}#{to_url_api_v3_partner_path(partner.id)}"
  json.created_at partner.created_at.localtime.to_s(:db)
  json.updated_at partner.updated_at.localtime.to_s(:db)
end
