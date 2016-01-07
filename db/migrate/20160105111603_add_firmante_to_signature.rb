class AddFirmanteToSignature < ActiveRecord::Migration
  def change
  	add_column :signatures, :firmante, :string
  	add_column :signatures, :fecha, :date
  end
end
