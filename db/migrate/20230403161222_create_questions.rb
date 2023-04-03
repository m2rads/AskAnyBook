class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question_text, limit: 140, name: :question
      t.text :context, null: true, default: ''
      t.text :answer, limit: 1000
      t.integer :ask_count, default: 1

      t.timestamps
    end
  end
end
