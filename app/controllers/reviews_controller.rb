class ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
     @sermon = @review.sermon
     @review.destroy
     flash[:success] = "Your comment was deleted"
     redirect_to @sermon
  end
end