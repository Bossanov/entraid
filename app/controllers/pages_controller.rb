class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :info, :liens, :pourquoi, :mention]

  def home
  end

  def info
  end

  def liens
  end

  def pourquoi
  end

  def mention
  end

  def admin
  end

  def test
  end
end
