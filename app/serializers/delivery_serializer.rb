class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :status, :due_date, :cohort, :user_id, :material_id
end
