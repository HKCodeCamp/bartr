json.array!(@items) do |item|
  json.partial! item
end