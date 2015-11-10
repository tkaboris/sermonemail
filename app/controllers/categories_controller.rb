class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]
  
  def show
    @category = Category.find(params[:id])
    @sermons = @category.sermons.paginate(page: params[:page], per_page: 4)
    
  end
  
  def new
    @category = Category.new
    
  end
  
  def create
    @category = Category.new(cat_params)
    if @category.save
    flash[:success] = "Category created sucessfully"
    redirect_to sermons_path
    else
    render 'new'
    end
  end
  
  private 
  def cat_params
    params.require(:category).permit(:name)
  end
end