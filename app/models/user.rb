class User < ActiveRecord::Base

  has_many :products
  has_many :comments
  belongs_to :city
  has_one :store
  has_many :favorites
  has_many :favorite_products, through: :favorites,
            source: :favorited, source_type: 'Product'

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def cart_count
    $redis.hlen "cart#{id}"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
