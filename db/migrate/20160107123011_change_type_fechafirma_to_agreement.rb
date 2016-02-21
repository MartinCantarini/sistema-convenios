class ChangeTypeFechafirmaToAgreement < ActiveRecord::Migration
  def change
  	change_column :agreements, :fechadefirma, :datetime
  end
end
