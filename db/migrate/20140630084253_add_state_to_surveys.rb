class AddStateToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :state, :string
  end
end
