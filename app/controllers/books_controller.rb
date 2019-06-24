class BooksController < ApplicationController
    before_action :corect_user, only: [:edit, :update, ]


	def new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "successfully."
            redirect_to book_path(@book)
        else
            flash[:notice] = "error"
            redirect_to books_path
        end
    end

    def index
        # @book = Book.new
        @books = Book.all
    end

    def show
        @book =Book.find(params[:id])
        @user = @book.user
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "successfully."
        else
            flash[:notice] = "error."
        end
        redirect_to book_path(@book)
    end


    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end




    private

    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end

    def corect_user
        book = Book.find(params[:id])
        if book.user != current_user
            redirect_to books_path
        end
    end

end
