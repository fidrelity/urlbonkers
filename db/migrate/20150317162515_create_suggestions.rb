class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|

      t.string :buzzword
      t.string :prefix
      t.string :suffix

      t.timestamps null: false
    end
  end
end
