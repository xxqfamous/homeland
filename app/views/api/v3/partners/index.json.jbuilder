json.count @partners.count
json.total_pages @partners.total_pages
json.current_page @partners.current_page

json.partners @partners, partial: "partner", as: :partner
