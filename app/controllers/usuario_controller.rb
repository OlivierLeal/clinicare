class UsuarioController < ApplicationController
  def index
    @usuarios = User.all
  end

  def edit
    @user = User.find(params[:id])  
  end
end
