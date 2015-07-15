json.array!(@incomes) do |income|
  json.extract! income, :id, :name, :salary
  json.url income_url(income, format: :json)
end
