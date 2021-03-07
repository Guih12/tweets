class Api::V1::PostController < ApplicationController
  
  before_action :authorized, only: [:index, :show, :create, :update , :destroy]

  def index
    @post = Post.all
    render json: @post
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.valid?
      render json: @post
    end
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      render json: {menssagem: 'Tweet criado com sucesso'}, status: :ok
    else
      @erros = @post.erros.full_messages
      render json: {menssagem: 'Error ao criar tweet', erro: @erros}
    end
  end

  def update
    post = Post.find_by(id: params[:id])
    
    if post.valid?
      post.update(post_params)
      render json: {menssagem: 'Tweet alterado!'}, status: :ok

    else
      @erros = post.erros.full_messages
      render json: {menssagem: 'Erro ao alterar tweet', erro: @erros}, status: :bad_request
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])

    if post.valid?
      post.destroy
      render json: {menssagem: 'Tweet deletado!'}, status: :ok
    else
      render json: {menssagem: 'Erro ao deletar!'}, status: :bad_request
    end
  end

  private
  
  def post_params
    params.permit(:title, :content, :user_id)
  end
end
