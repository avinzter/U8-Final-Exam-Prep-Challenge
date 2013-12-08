class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :population
      t.float :median_age
      t.float :life_expectancy
      t.float :gdp
      t.boolean :mandatory_military_service

      t.timestamps
    end
  end
end
