class User < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify

  has_secure_password

  validates_presence_of( :first_name, :last_name)
  validates :email, presence: true, uniqueness: true

end
