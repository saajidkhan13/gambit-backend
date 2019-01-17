class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :funds, :address
  has_many :portfolios
end
