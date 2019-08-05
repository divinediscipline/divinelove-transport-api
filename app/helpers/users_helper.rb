module UsersHelper
  def json_responses(response_object, status = 400)
    render json: response_object, status: status
  end
end