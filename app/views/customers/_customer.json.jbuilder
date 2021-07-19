json.extract! customer, :id, :short_name, :origin, :sq, :level, :full_name, :linkman, :address, :phone, :fax, :mobile, :email, :website, :main_purchase, :track_result, :note, :created_at, :updated_at
json.url customer_url(customer, format: :json)
