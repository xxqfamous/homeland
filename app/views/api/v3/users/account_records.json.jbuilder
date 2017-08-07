json.count @account_records.count
json.total_pages @account_records.total_pages
json.current_page @account_records.current_page

json.account_records @account_records, partial: "account_record", as: :account_record
