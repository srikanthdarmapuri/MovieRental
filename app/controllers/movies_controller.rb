class MoviesController < ApplicationController
  def new
    @movie = Movie.new    
  end
  def create
   @movie = Movie.new(params[:movie].permit(:name, :language, :year, :movie_type))
 
    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end  
  end
   
  def show
    @movie = Movie.find(params[:id])
  end
  def index
    @movies= Movie.all
  end

private
  def movie_params
    params.require(:movie).permit(:name, :language, :year, :movie_type)
  end
  
end
