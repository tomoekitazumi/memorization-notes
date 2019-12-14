class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :folder, foreign_key: true
      t.string :question
      t.string :answer
      t.string :explanation

      t.timestamps
    end
  end
end
