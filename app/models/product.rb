class Product < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :uploads, :dependent => :destroy

end
