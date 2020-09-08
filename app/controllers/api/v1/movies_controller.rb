class Api::V1::MoviesController < ApplicationController
    before :set_movie, only:[:show,:update,:destroy]
    skip_before_action name :authenticate, only: [:index, :show]
    
    def index
        @movies = Movie.all
        render json: @movies
    end

    def show
        @review = Review.where(movie_id: params(:id))
        render json: { movie: @movie, reviews: @reviews }
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            render json: @movie
        else
            render json: @movie.errors status: :unprocessable_entity
        end 
    end

    def update
        if @movie.update(movie_params)
            render json: @movie
        else
            render json: @movie.errors, status: :uproccessable_entity
        end
    end

    def destroy
        @movie.destroy
    end
    
    def get_upload_credentials
        @accessKey = ENV('S3_ACCESS')
        @secretKey = ENV('S3_SECRET')
        render json: { accessKey: @accessKey, secretKey: @secretKey }
    end

    private

    def set_movie
        @movie = Movie.find(params(:id))
    end

    def movie_params
        params.require(:movie).permit(:title, :description, :parental_rating, :year, :total_gross, :duration, :image, :cast, :director)
    end
end
