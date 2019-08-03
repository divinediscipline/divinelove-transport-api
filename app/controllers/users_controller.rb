class UsersController < ApplicationController

  def create
    return json_response({status: "error", error: "password_confirmation field is missing" }) if !user_params[:password_confirmation]
    @user = User.new(user_params)
    if @user.save
      json_response({ status: "success", data: @user }, 201)
    else
      json_response({ status: "error", error: @user.errors.full_messages })
    end
  end

  private

    def user_params
      params.permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end
end
