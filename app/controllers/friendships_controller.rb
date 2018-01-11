class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "You are friend!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_message.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:alert] = "Unfriend now"
    redirect_back(fallback_location: root_path)
  end


end
