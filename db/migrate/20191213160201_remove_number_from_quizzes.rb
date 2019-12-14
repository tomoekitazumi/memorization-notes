class RemoveNumberFromQuizzes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quizzes, :number, :int
  end
end
