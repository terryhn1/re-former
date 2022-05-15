class UsersController < ApplicationController
    def new
        @user = User.new()
    end

    def edit
    end

    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to user_url(@user), notice: "Friend was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to new_user_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end


end
