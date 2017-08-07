# @class banner
# 广告商
#
# == attributes
# - *id* [Integer] 编号
# - *name* [String] 节点名称
# - *sort* {Integer} 排序优先级
# - *updated_at* [DateTime] 更新时间
if banner
  json.(banner, :id, :title, :href, :sort)

  json.img banner.img_url
  #
  json.created_at banner.created_at.localtime.to_s(:db)
  json.updated_at banner.updated_at.localtime.to_s(:db)
end
