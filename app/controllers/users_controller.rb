class UsersController < ApplicationController
    
    def index
    @users = User.all
    end

    def show
    end
    
    def downgrade
    @user = User.find(params[:id])
    @user.role = 'standard'

    if @user.save
      flash[:notice] = "You've been downgraded to standard. Your private wikis are now public."
      redirect_to :back
    else
      flash[:error] = "There was an error creating your account. Please try again."
      redirect_to :back
    end
    
     @user_wikis = @user.wikis.where(private: true)
     
      @user_wikis.each do |makepub|
      makepub.update_attributes(private: false)
    end
  end
    
    
end
