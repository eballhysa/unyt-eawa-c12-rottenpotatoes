# This file is app/controllers/movies_controller.rb

class MoviesController < ApplicationController

  before_action :enforce_login, except: [:index, :show]
  before_action :set_current_user

  def index
    @movies = Movie.all
    respond_to do |client_wants|
      p client_wants
      client_wants.html
      client_wants.xml {render xml: @movies.to_xml}
      client_wants.json {render json: @movies.to_json}
      client_wants.yaml {render text: @movies.to_yaml, content_type: 'text/yaml'}
    end
  end

  def show
    @movie = Movie.find params[:id]
    respond_to do |client_wants|
      client_wants.html {render 'show'}
      client_wants.xml {render xml: @movie.to_xml}
      client_wants.json {render json: @movie.to_json}
      client_wants.yaml {render text: @movie.to_yaml, content_type: 'text/yaml'}
    end
  end

  def new
    @movie = Movie.new
    render 'new'
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:notice] = "Movie #{@movie.title} was successfully created"
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    if @movie.update movie_params
      flash[:notice] = "Movie #{@movie.title} successfully updated!"
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Movie #{@movie.title} successfully deleted!"
    redirect_to movies_path
  end

  def enforce_login
    redirect_to login_path unless logged_in?
  end

  def set_current_user
    mg_id = session[:current_mg_id]
    @current_moviegoer = Moviegoer.find mg_id if logged_in?
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :rating, :release_date)
  end


end