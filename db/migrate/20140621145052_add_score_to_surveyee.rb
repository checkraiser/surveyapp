class AddScoreToSurveyee < ActiveRecord::Migration
  def change
    add_column :surveyees, :score, :integer
  end
end
