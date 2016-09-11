class MessageSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :user_type, :category_name, :phone_num 
end
