class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
