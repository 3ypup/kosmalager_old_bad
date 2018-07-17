class Album < ApplicationRecord
  has_many :pics

  validates :title, presence: true 
  validates :title, :length => {:minimum => 3, :maximum => 20} 
  validates :author, presence: true
  
  validates :image, presence: true
  validates_format_of :image,  :with => %r{(png|jpg|jpeg)}i, :message => "Неправильный формат файла !!"

  mount_uploader :image, AlbumimgUploader
  

end
