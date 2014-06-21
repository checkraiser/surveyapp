class AddRandomStringToSurveyee < ActiveRecord::Migration
  def change
    add_column :surveyees, :random_string, :string
  end
end
