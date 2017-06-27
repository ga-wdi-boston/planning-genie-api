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

User.create(email: 'e@aol.com',
            password: 'p',
            password_confirmation: 'p',
            github_username: 'gh')

User.create(email: 'yo',
            password: 'yo',
            password_confirmation: 'yo',
            github_username: 'yo')

Profile.create(given_name: 'Chris',
               family_name: 'Payne',
               photo_url: 'http://aws.com',
               preferences: 'multer',
               user_id: 2)

Material.create(user_id: 2,
                material_type: 'template',
                name: 'rails-api-template')

Material.create(user_id: 1,
                material_type: 'study',
                name: 'rails-api-study')

Delivery.create(
  [
    {
      user_id: 1,
      material_id: 1,
      status: 'ready',
      cohort: '017',
      due_date: DateTime.new(2001, 2, 3)
    },
    {
      user_id: 2,
      material_id: 2,
      status: 'prepared',
      cohort: 'lm01',
      due_date: DateTime.new(2001, 4, 5)
    },
    {
      user_id: 2,
      material_id: 1,
      status: 'delivered',
      cohort: '017',
      due_date: DateTime.new(2001, 6, 7)
    }
  ]
)
