class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :anuncios, class_name: 'Advertising', dependent: :restrict
end
