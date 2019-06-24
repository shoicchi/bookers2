class UsersController < ApplicationController
	before_action :corect_user, only: [:edit, :update, ]



	def top
	end

	def about
	end


	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
    		flash[:notice] = "successfully."
    	else
    		flash[:notice] = "error"
    	end
    	redirect_to user_path(current_user)
	end

	def index
		@users = User.all
	end

	def show
		@users = User.all
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end

	def destroy
	end



	private

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def corect_user
		user = User.find(params[:id])
		if user != current_user
			redirect_to user_path(current_user)
		end
	end

end
