class Admin::ItemsController < ApplicationController
  befor_action :authenticate_admin!
  
  def new
  end

  def index
  end

  def show
  end

  def edit
  end
end
