class BooksController < ApplicationController

    before_action :find_book, only: [:show, :edit, :update, :destroy]
    def index
        @books = Book.all.order("created_at DESC")
    end

    def show
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path
        end 
    end

    def edit
    end

    def update
        if @book.update(book_params)
        redirect_to book_path(@book)
        
        else
            render 'edit'
        end

    end

    def destroy
        @book.destroy
        redirect_to books_path
    end


    private

    def book_params
        params.require(:book).permit(:title, :description, :author, :book_img)
    end

    def find_book
        @book = Book.find(params[:id])
    end


end
