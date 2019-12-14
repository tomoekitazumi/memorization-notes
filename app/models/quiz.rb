class Quiz < ApplicationRecord
  belongs_to :folder
  
  validates :question, presence: true, length: { maximum: 255 }
  validates :answer, presence: true, length: { maximum: 255 }
  validates :explanation, length: { maximum: 255 }
  
  # def previous
  #   Quiz.where("id < ?", self.id).order("id DESC").first
  # end
 
  # def next
  #   Quiz.where("id > ?", self.id).order("id ASC").first
  # end
  
end
