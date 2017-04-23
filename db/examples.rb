# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

User.create(email: 'e',
            password: 'p',
            password_confirmation: 'p',
            github_username: 'gh')

User.create(email: 'yo',
            password: 'yo',
            password_confirmation: 'yo',
            github_username: 'yo')

Material.create(user_id: 2,
                material_type: 'template',
                name: 'rails-api-template',
                due_date: '01-04-2000')

Material.create(user_id: 1,
                material_type: 'study',
                name: 'rails-api-study',
                due_date: '08-03-1900')

Delivery.create([{
                  user_id: 1,
                  status: 'ready',
                  cohort: '017',
                  material_id: 1
                },
                {
                  user_id: 2,
                  status: 'prepared',
                  cohort: 'lm01',
                  material_id: 2
                },
                {
                  user_id: 2,
                  status: 'delivered',
                  cohort: '017',
                  material_id: 1
                }])
