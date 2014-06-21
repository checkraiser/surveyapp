class CreateSurveyees < ActiveRecord::Migration
  def change
    create_table :surveyees do |t|
      t.string :email
      t.integer :survey_id

      t.timestamps
    end
  end
end
