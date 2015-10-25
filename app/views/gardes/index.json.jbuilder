json.array! @gardes do |garde|
	json.title garde.planning.name
  json.start garde.started_on
  json.end garde.started_on
  json.all_day true
  json.color garde.color
end
