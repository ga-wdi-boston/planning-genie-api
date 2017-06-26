# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :materials, through: :deliveries
  has_many :deliveries
end
