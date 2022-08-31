json.extract! plan, :id, :code, :name, :monthly_income, :unit_price, :max_unit_limit, :created_at, :updated_at
json.url plan_url(plan, format: :json)
