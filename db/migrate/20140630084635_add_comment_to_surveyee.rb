class AddCommentToSurveyee < ActiveRecord::Migration
  def change
    add_column :surveyees, :comment, :text
  end
end
