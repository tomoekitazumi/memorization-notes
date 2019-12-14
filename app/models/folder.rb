class Folder < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 50 }
  
  has_many :quizzes, dependent: :destroy
  has_many :favorites, foreign_key: 'folder_id', dependent: :destroy
  has_many :users, through: :favorites
end
