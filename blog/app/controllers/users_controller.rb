class UsersController < ApplicationController
  def Index
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    
    if @user.save
      flash[:status] = TRUE
      flash[:alert] = 'CG ! U have successfully registered !'
      
    else
      flash[:status] = FALSE
      flash[:alert] = @user.errors.full_messages
    end
    redirect_to register_path
  end
  
  
end
