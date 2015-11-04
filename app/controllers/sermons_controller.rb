class SermonsController < ApplicationController
	def index
	  @sermons = Sermon.all
	end
	
	def show
	  @sermon = Sermon.find(params[:id])
	end
	
	def new
	  @sermon = Sermon.new 
	end
	
	def create
	  @sermon = Sermon.new(sermon_params)
	  @sermon.pastor = Pastor.find(2)
	  
	  if @sermon.save
	    flash[:success] = "Your sermon was successfully created"
	    redirect_to sermons_path
	  else
	    render :new
	  end
	end
	
	def edit
	  @sermon = Sermon.find(params[:id])
	end
	
	def update
	  @sermon = Sermon.find(params[:id])
	  if @sermon.update(sermon_params)
	    #doo somethig
	    flash[:success] = "Your sermon was updated successfully"
	    redirect_to sermon_path(@sermon)
	    else
	      render :edit
	 end
	    
	end
	
	
	private
	  def sermon_params
	    params.require(:sermon).permit(:name, :summary, :description)
	  end
	
	
end