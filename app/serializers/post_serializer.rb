class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at

  has_many :comments
  has_one :user

end
