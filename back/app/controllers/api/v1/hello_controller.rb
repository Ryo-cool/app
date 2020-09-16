class Api::V1::HelloController < ApplicationController
  
  def index
    users = "あか"
    render json: users
  end
end
