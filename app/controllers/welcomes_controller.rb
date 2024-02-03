class WelcomesController < ApplicationController

  before_action :authenticate_user!, only: %i[ vendeur client list ]

  def index

    @users = User.all

  end

  def vendeur

    @users = User.all

    if current_user && current_user.role == "Eleveur"
      @farmers = current_user.farmer
    else
      render :back
    end

  end

  def client

    @users = User.all

  end

  def list
    @users = User.all
  end

end
