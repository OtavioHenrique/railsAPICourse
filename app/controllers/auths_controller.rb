class AuthsController < ApplicationController
  def create
    hmac_secret = "mySecret"
    payload = { name: params[:name], exp: Time.now.to_i + 60 }
    token = JWT.encode payload, hmac_secret, "HS512"
    render json: { token: token }
  end
end
