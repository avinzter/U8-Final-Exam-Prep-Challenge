class WorldController < ApplicationController
  def index
  	@country = Country.order('name')
  end

  def by_population
  	@country = Country.order('population DESC')
  end

  def by_age
  	@country = Country.order('median_age').where('median_age > 30')
  end

  def by_required_service
  	@country = Country.where(:mandatory_military_service => true).order('life_expectancy')
  end

  def search
  end

  def search_results
    @keywords = params[:keyword]
    @country = Country.where("name LIKE '%#{params[:keyword]}%'")
    if @country.empty?
      flash[:error] = "Country doesn't exist"
      redirect_to search_path
    end
  end

end
