json.array! Category.find("#{params[:child_id]}").children do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end