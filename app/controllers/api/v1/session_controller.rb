class Api::V1::SessionController < ApplicationController
  
  def create
    @user = User.find_by(email: params[:email])

    if @user &&@user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Email ou senha inválidos"}, status: :bad_request
    end
  end

end
