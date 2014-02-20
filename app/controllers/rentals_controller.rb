class RentalsController < ApplicationController
  def new
    @rental = Rental.new    
  end
  def create 
     @rental = Rental.new(params[:rental].permit(:name, :mobile))
     name_found = Movie.find_by_name(params[:rental][:name])
     mobile_found = Customer.find_by_mobile(params[:rental][:mobile])
     movies_count_ofcust = Rental.where(:mobile => params[:rental][:mobile]).count
     movie_found = Rental.find_by_name(params[:rental][:name])
     puts "rental with this phone number = #{movies_count_ofcust}"
     if !name_found
       flash[:error] = "Movie not available"
       render 'new'  
     elsif !mobile_found
       flash[:error] = "Not previous customer"
       render 'new'  
     elsif movies_count_ofcust == 5 
         flash[:error] = "number of movies limit reached for this customer"
         render 'new'
     elsif movie_found
         flash[:error] = "this movie is already taken"
         render 'new'
     else      
         if @rental.save
           redirect_to @rental
         else
           render 'new'
         end
     end    
  end
   
  def show
    @rental = Rental.find(params[:id])
  end
  def index
    @rentals= Rental.all
  end
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
   
    redirect_to rentals_path
  end

private
  def rental_params
    params.require(:rental).permit(:name, :mobile)
  end
end