# frozen_string_literal: true

# require ICS parsing script, which gives access to
# EVENTS_EXPORT, an array of hashes representing materials
require Rails.root.join("scripts", "parse-ics.rb")

EVENTS_EXPORT.each do |e|
  Material.create(name: e[:name],
                  material_type: e[:type],
                  length: e[:length],
                  user_id: 1)
end
