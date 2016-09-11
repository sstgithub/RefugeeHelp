class UserSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :user_type, :category_name, :phone_num, :first_name, :last_name, :current
end
