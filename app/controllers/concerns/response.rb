module Response
  def json_response(object, meta={})
    if meta.blank?
      render json: JSON.pretty_generate({ data: object.as_json })
    else
      render json: JSON.pretty_generate({ data: object.as_json, meta: meta })
    end
  end
end