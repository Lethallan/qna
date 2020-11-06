class FilesController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @file = ActiveStorage::Attachment.find(params[:id])
    if current_user == @file.record.user
      @file.purge
      redirect_to @file.record
    end
  end
end
