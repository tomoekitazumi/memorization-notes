class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :folders
  has_many :favorites
  has_many :favfolders, through: :favorites, source: :folder
  
  def like(folder)
    favorites.find_or_create_by(folder_id: folder.id)
  end
  
  def unlike(folder)
    favorite = favorites.find_by(folder_id: folder.id)
    favorite.destroy if favorite
  end
  
  def favfolder?(folder)
    self.favfolders.include?(folder)
  end
  
end
