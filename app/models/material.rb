# frozen_string_literal: true
class Material < ApplicationRecord
  has_many :deliveries
  has_many :users, through: :materials
end
