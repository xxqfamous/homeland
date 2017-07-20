json.count @banners.count
json.total_pages @banners.total_pages
json.current_page @banners.current_page

json.advertisers @banners, partial: "banner", as: :banner
