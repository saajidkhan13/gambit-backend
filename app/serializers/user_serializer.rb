class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :funds, :address
end
