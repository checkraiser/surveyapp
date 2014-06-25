class CreateSuggestedQuestions < ActiveRecord::Migration
  def change
    create_table :suggested_questions do |t|
      t.text :content

      t.timestamps
    end
  end
end
