class AddDenominacionToAgreement < ActiveRecord::Migration
  def change
  	add_column :agreements, :denominacion, :string
  end
end
