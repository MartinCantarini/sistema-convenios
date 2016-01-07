class AddFieldsToAgreement < ActiveRecord::Migration
  def change
  	add_column :agreements, :expediente, :char
  	add_column :agreements, :contacto, :char
  	add_column :agreements, :fechadefirma, :char
  	add_column :agreements, :compromisoeconomico, :char
  	add_column :agreements, :duracion, :char
  	add_column :agreements, :estado, :char
  	add_column :agreements, :decreto, :char
  	add_column :agreements, :objeto, :text
  	add_column :agreements, :observaciones, :text
  end
end
