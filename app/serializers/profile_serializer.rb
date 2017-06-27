class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name, :photo_url, :preferences, :user_id
end
