class PagesController < ApplicationController
  def home
    redirect_to sermons_path if logged_in?
    
  end
end
