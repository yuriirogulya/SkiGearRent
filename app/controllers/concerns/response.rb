module Response
  def json_response(object, status = :ok)
      render json: JSON.pretty_generate({ items: object.as_json }), status: status
  end
end