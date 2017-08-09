json.partner do
  json.partial! partial: "partner_show", locals: { partner: @partner }
end
# json.meta @meta
