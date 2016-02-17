class User < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify

  has_secure_password

  

end
