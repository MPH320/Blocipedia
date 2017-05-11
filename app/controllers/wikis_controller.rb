class WikisController < ApplicationController
    include ApplicationHelper
    
    before_action :authenticate_user!, except: [:index, :show]
    
  def index
    @wikis = Wiki.all
    
     @wikis = Wiki.visible_to(current_user)

    if current_user.premium? || current_user.admin?
      @wikis = Wiki.all
    end
  end

  def show
     @wiki = Wiki.find(params[:id])
     authorize @wiki
  end
  
  def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
   end
  
  def update
     @wiki = Wiki.find(params[:id])
     authorize @wiki
 
     @wiki.assign_attributes(wiki_params)
     @wiki.user_ids = params[:wiki][:user_ids] if params[:wiki][:user_ids].present?
 
     if @wiki.save
        flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash[:error] = "Error saving wiki. Please try again."
       render :edit
     end
   end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
     @wiki = Wiki.find(params[:id])
     authorize @wiki
   end
  
  def create
     @wiki = Wiki.create(wiki_params)
     @wiki.user = current_user
     authorize @wiki
 
     if @wiki.save
       redirect_to @wiki, notice: "Wiki was saved successfully."
     else
       flash[:error] = "Error creating wiki. Please try again."
     end
   end
   
   private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private )
  end
   
end
