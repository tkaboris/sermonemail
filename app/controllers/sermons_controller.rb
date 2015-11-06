class SermonsController < ApplicationController
	def index
	  @sermons = Sermon.paginate(page: params[:page], per_page: 4)
	  # change to sort by date
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
	
	def like
		@sermon = Sermon.find(params[:id])
		like = Like.create(like: params[:like], pastor: Pastor.first, sermon: @sermon)
		if like.valid?
			
			flash[:success] = "Your selection was successful"
			redirect_to :back
		else
			
		end
		flash[:danger] = "you can only like or dislike sermon once"
		redirect_to :back
	end
	
		
	private
	  def sermon_params
	    params.require(:sermon).permit(:name, :summary, :description, :picture)
	  end
	
	
end