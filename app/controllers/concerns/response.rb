module Response
  def json_response(object, params)
    render json: object,:callback => params[:callback]
  end
end