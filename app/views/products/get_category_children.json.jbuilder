json.array! Category.find("#{params[:parent_id]}").children do |child|
  json.id child.id
  json.name child.name
end