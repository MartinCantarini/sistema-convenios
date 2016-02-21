class ChangeTypeFechafirmaToAgreement < ActiveRecord::Migration
  def change
  	change_column :agreements, :fechadefirma, :integer
  end
end
