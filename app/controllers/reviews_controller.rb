class ReviewsController < ApplicationController
  before_action :set_current_user
  before_action :has_moviegoer_and_movie, only: [:new, :create]

  def has_moviegoer_and_movie
    unless @current_moviegoer
      flash[:warning] = 'You need to login to enter a review'
      redirect_to login_path
    end
    @movie = Movie.find params[:movie_id]
    unless @movie
      flash[:warning] = 'Review must be associated with an existing movie'
      redirect_to movies_path
    end
  end

  def new
    @review = @movie.reviews.build
  end

  def create
    @current_moviegoer.reviews << @movie.reviews.build(review_params)
    flash[:notice] = 'Review successfully added!'
    redirect_to movie_path(@movie)
  end

  private
  def review_params
    params.require(:review).permit(:potatoes, :comments)
  end
end