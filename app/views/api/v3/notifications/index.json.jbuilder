json.count @notifications.count
json.total_pages @notifications.total_pages
json.current_page @notifications.current_page

json.notifications @notifications, partial: "notification2", as: :notification
