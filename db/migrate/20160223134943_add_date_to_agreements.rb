class AddDateToAgreements < ActiveRecord::Migration
  def change
  	add_column :agreements, :fechadefirma, :date
  end
end
