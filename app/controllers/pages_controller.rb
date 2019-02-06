class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @todo = Todo.where(user: current_user).incomplete.order("id DESC").first
  end

  def show
  end
end
