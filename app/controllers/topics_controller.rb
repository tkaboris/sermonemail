class TopicsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def show
    @topic = Topic.find(params[:id])
    @sermons = @topic.sermons.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @topic = Topic.new
  end  
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Topic created successfully"
      redirect_to sermons_path
    else
      render 'new'
    end
  end
  
  private
  def topic_params
    params.require(:topic). permit(:name)
  end
  
end
