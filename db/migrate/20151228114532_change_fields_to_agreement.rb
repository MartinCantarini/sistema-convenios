class ChangeFieldsToAgreement < ActiveRecord::Migration
  def change
  	change_column :agreements, :expediente, :string
  	change_column :agreements, :contacto, :string
  	change_column :agreements, :fechadefirma, :string
  	change_column :agreements, :compromisoeconomico, :string
  	change_column :agreements, :duracion, :string
  	change_column :agreements, :estado, :string
  	change_column :agreements, :decreto, :string
  end
end
