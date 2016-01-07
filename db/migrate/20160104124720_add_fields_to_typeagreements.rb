class AddFieldsToTypeagreements < ActiveRecord::Migration
  def change
  	add_column :typeagreements, :denominacion, :string
  end
end
