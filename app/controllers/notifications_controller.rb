class NotificationsController < ApplicationController

  def new
    @notification = Notification.new
  end

  def create
  end

  def supprimer_notification
    @notification = Notification.find(params[:format])
    @notification.destroy
    redirect_to pages_notification_path
  end
end
