json.user do
  json.partial! partial: "me", locals: { user: @user, detail: true }
end
json.meta @meta
