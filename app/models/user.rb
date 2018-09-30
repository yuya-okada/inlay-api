class User < ApplicationRecord
  has_many :projects
  # Include default devise modules.
  devise :database_authenticatable, 
        :registerable,
        :recoverable, 
        :rememberable, 
        :trackable,  
        :validatable, 
        :omniauthable
  include DeviseTokenAuth::Concerns::User
end
