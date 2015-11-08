class LoginsController < ApplicationController
  def new
    
  end
  
  def create
    pastor = Pastor.find_by(email: params[:email])
    if pastor && pastor.authenticate(params[:password])
      session[:pastor_id] = pastor.id
      flash[:success] = "You are logged in"
      redirect_to sermons_path
    else
      flash.now[:danger] = "Your email or password dont match"
      render 'new'
    end
  end
  
  def destroy
    session[:pastor_id] = nil
    flash[:success] = "You are logged out"
    redirect_to root_path
  end
end
