class SermonsController < ApplicationController
	before_action :set_sermon, only: [:edit, :update, :show, :like]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update]
	
	
	def index
	  @sermons = Sermon.paginate(page: params[:page], per_page: 4)
	  # change to sort by date
	end
	
	def show
	  
	end
	
	def new
	  @sermon = Sermon.new 
	end
	
	def create
	  @sermon = Sermon.new(sermon_params)
	  @sermon.pastor = current_user
	  
	  if @sermon.save
	    flash[:success] = "Your sermon was successfully created"
	    redirect_to @sermon
	    # redirect_to @sermon
	  else
	    render :new
	  end
	end
	
	def edit
	end
	
	def update
		if @sermon.update(sermon_params)
	    flash[:success] = "Your sermon was updated successfully"
	    redirect_to sermon_path(@sermon)
	  else
	      render :edit
		end
	end
	
	def like
		like = Like.create(like: params[:like], pastor: current_user, sermon: @sermon)
		if like.valid?
			flash[:success] = "Your selection was successful"
			redirect_to :back
		else
			flash[:danger] = "you can only like or dislike sermon once"
			redirect_to :back
		end
	end
	
	# def destroy
 #   Sermon.find(params[:id]).destroy
 #   flash[:success] = "Sermon Deleted"
 #   redirect_to recipes_path
 # end
		
	private
	  def sermon_params
	    params.require(:sermon).permit(:name, :summary, :description, :picture)
	  end
	  
	  def set_sermon
	  	@sermon = Sermon.find(params[:id])
	  end
	  
	  def require_same_user
	  	if current_user != @sermon.pastor
	  		flash[:danger] = "You can only edit your sermons"
	  		redirect_to sermons_path
	  	end
			end
end