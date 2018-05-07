module Response
  def json_response(object, status = :ok)
      render json: JSON.pretty_generate({ data: object.as_json, status: status })
  end
end