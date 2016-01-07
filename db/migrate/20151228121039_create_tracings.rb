class CreateTracings < ActiveRecord::Migration
  def change
    create_table :tracings do |t|

      t.timestamps null: false
    end
  end
end
