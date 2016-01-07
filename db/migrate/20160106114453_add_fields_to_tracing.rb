class AddFieldsToTracing < ActiveRecord::Migration
  def change
  	add_column :tracings, :estado, :string
  	add_column :tracings, :fecha, :date
  	add_reference :tracings, :agreement, index: true
  end
end
