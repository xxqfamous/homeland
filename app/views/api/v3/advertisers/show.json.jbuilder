json.advertiser do
  json.partial! partial: "advertiser_show", locals: { advertiser: @advertiser }
end
# json.meta @meta
