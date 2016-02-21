class ChangeTypeFechafirmaToAgreement < ActiveRecord::Migration
  def up
<<<<<<< HEAD
  	remove_column :agreements, :fechadefirma
=======
    remove_column :agreements, :fechadefirma
  end

  def down
    add_column :agreements, :fechadefirma, :date
>>>>>>> 0321bd0703b1d3f4ea8b16f500c6d5f87a592747
  end
  def down
  	add_column :agreements, :fechadefirma, :date
  end	
end
