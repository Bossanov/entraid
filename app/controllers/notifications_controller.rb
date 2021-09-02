class NotificationsController < ApplicationController

  def new
    @notification = Notification.new
  end

  def create
  end
end
