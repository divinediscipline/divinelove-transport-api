class UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create

  # def create
  #   return json_response({status: "error", error: "password_confirmation field is missing" }) if !user_params[:password_confirmation]
  #   @user = User.new(user_params)
  #   if @user.save
  #     json_response({ status: "success", data: @user }, 201)
  #   else
  #     json_response({ status: "error", error: @user.errors.full_messages })
  #   end
  # end

  # private

  #   def user_params
  #     params.permit(:first_name, :last_name, :email, :password,
  #                                  :password_confirmation)
  #   end



  # return authenticated token upon signup
  def create
    return json_response({status: "error", error: "password_confirmation field is missing" }) if !user_params[:password_confirmation]
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { 
      status: Message.account_created,
      data: {
        user_id: user.id,
        is_admin: user.is_admin,
        token: auth_token
      } 
    }
    json_response(response, 200)
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
