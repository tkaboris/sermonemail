class PastorsController < ApplicationController
  before_action :set_pastor, only[:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  
  def index
    @pastors = Pastor.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @pastor = Pastor.new
  end
  
  def create
    @pastor = Pastor.new(pastor_params)
    if @pastor.save
      flash[:success] = "Your account was created successfully"
      session[:pastor_id] = @pastor.id
      redirect_to  sermons_path
    else
      render 'new'
    end
  end
  
  def edit
   
  end
  
  def update
    if @pastor.update(pastor_params)
    flash[:success] = "Your account was updated successfully"
    redirect_to pastor_path(@pastor)
  else
    render 'edit'
    end
  end
  
  def show
    @sermons = @pastor.sermons.paginate(page: params[:page], per_page: 3)
  end
  
  
  private
  
  def pastor_params
    params.require(:pastor).permit(:pastorname, :email, :password)
  end
  
  def set_pastor
     @pastor = Pastor.find(params[:id])
  end
  
  def require_same_user
    if current_user != @pastor
      flash[:danger]= "You can only edit your own profile"
      redirect_to root_path
    end
  end
  
end
