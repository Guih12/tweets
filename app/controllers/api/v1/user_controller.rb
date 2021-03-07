class Api::V1::UserController < ApplicationController
  
  before_action :authorized, only: [:index, :show]

  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    if @user.valid?
      render json: @user
    else
      render json: {msg: 'Usuário não encontrado'}, status: :no_content
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {msg: 'Usuário criado com sucesso'}, status: :ok
    else
      @erros = @user.errors.full_messages
      render json: {message: 'Erro ao criar usuário', erro: @erros}
    end
  end

  private

  def user_params
    params.permit(:name, :lastname, :email, :password, :user_avatar)
  end
end
