class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = current_user.items.build( item_params )
    @item.user = @user
    @new_item = Item.new

      if @item.save
        flash[:notice] = "To do item was created."

      else
        flash[:error] = "There was an error saving the to do item. Please try again."

      end
      respond_to do |format|
       format.html
       format.js
      end
  end
  def destroy


    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "The To do Item was removed."


    else
      flash[:error] = "The to do item couldn't be deleted. Try again."

    end

    respond_to do |format|
     format.html
     format.js
    end
  end


private
  def item_params
    params.require(:item).permit(:name)
  end
end
