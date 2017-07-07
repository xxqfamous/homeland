json.count @advertisers.count
json.total_pages @advertisers.total_pages
json.current_page @advertisers.current_page

json.advertisers @advertisers, partial: "advertiser", as: :advertiser
