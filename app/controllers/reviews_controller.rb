class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.create(review_params)
    end

    def edit
    end

    def update
    end

    def review_params
        params.require(:review).permit(:rating, :comment, :book_d, :user_id)
    end

end
