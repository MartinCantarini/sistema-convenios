class ChangeTypeFechafirmaToAgreement < ActiveRecord::Migration
  def change
  	change_column :agreements, :fechadefirma, :date
  end
end
