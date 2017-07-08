class Delivery < ApplicationRecord
  belongs_to :material
  belongs_to :user
  validates :cohort, uniqueness: { scope: :material, case_sensitive: false,
    message: "Specified material is already being delivered for this cohort." }
end
