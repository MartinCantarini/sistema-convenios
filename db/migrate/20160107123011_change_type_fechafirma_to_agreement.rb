class ChangeTypeFechafirmaToAgreement < ActiveRecord::Migration
  def change
  	change_column :agreements, :fechadefirma, "USING fechadefirma::date"
  end
end
