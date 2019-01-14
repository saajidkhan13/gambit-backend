class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :funds, :address
end
