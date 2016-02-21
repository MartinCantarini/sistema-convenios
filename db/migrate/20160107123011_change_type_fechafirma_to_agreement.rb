class ChangeTypeFechafirmaToAgreement < ActiveRecord::Migration
  def up
    remove_column :agreements, :fechadefirma
  end

  def down
    add_column :agreements, :fechadefirma, :date
  end
end
