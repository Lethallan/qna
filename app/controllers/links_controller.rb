class LinksController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @link= Link.find(params[:id])

    if current_user == @link.linkable.user
      @link.destroy
      redirect_to @link.linkable
    end
  end
end
