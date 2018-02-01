class MocksController < ApplicationController
  include MockService
  include MockServersHelper::HttpMethods

  def when
    mock_server_id = params[:mock_server_id]
    mock = Mock.new(mock_params.merge(mock_server_id: mock_server_id))
    if mock.save
      respond_to do |format|
        format.json { render json: "mock saved successfully" }
      end
    else
      respond_to do |format|
        format.json { render json: "something went wrong" }
      end

    end
  end

  def mock_post
    get_result POST
  end

  def mock_get
    get_result GET
  end

  def mock_put
    get_result PUT
  end


  def mock_delete
    get_result DELETE
  end

  private
  def get_result method
    url = params[:other]
    query_params = params.except(:other, :mock, :mock_server_id, :body)
    mock_server_id = params[:mock_server_id]
    body = params[:body]
    result = find_mocked_result(url, query_params, body, mock_server_id, method)
    render status: result[:status], json: result[:response]
  end

  def mock_params
    params.require(:mock).permit(:url, :body, :query, :result, :method)
  end
end