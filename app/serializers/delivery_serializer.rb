class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :status, :date, :cohort, :user_id, :material_id
end
