class User < ActiveRecord::Base

  has_many :products
  has_many :comments
  belongs_to :city
  has_one :store
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
