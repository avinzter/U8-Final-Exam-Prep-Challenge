class Country < ActiveRecord::Base
  attr_accessible :gdp, :life_expectancy, :mandatory_military_service, :median_age, :name, :population
end
