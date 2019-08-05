module Response
  def json_response(response_object, status = 422)
    render json: response_object, status: status
  end
end
