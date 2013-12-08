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
    @search_options = ['All Country', 'Country with mandatory military service', 'Countries without mandatory military service']
  end

  def search_results
    @keywords = params[:keyword]
    @search_selected = params[:mandatory_military_service]

    if @search_selected == 'All Country'
      @country = Country.where("name LIKE '%#{params[:keywords]}%'")
    elsif @search_selected == 'Country with mandatory military service'
      @country = Country.where("name LIKE '%#{params[:keywords]}%'").where(:mandatory_military_service => true)
    elsif @search_selected == 'Countries without mandatory military service'
      @country = Country.where("name LIKE '%#{params[:keywords]}%'").where(:mandatory_military_service => false)
    end
    
    if @country.empty?
      flash[:error] = "Country doesn't exist"
      redirect_to search_path
    end
  end

end
