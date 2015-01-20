class Product < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :uploads, :dependent => :destroy

  validates :name, :price, :quantity, presence: true
  validates :description, presence: true, length: { maximum: 300 }

  def in_cart?(current_user_id)
    $redis.hexists "cart#{current_user_id}", id
  end

  def cart_quantity
    $redis.hget "cart#{current_user_id}", id
  end

end
