class Product < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :uploads, :dependent => :destroy

  validates :name, :price, presence: true
  validates :description, presence: true, length: { maximum: 300 }

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end

end
