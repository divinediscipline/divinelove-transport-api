class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    # kindly refactor and add more keys to the response object when needed
    response = { 
      status: Message.account_created,
      data: {
        token: auth_token
      } 
    }
    json_response(response, 200)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end