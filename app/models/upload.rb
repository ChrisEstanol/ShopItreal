class Upload < ActiveRecord::Base

  belongs_to :product

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "200x200>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true

end
