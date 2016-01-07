class CreateTypeagreements < ActiveRecord::Migration
  def change
    create_table :typeagreements do |t|

      t.timestamps null: false
    end
  end
end
