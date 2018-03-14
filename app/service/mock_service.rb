module MockService
  def find_mocked_result(url, query_params, body, mock_server_id, method)
    matching_mocks = Mock.where(
                          mock_server_id: mock_server_id,
                          url: "/#{url}",
                          method: method)
    matching_mocks.map do |m| puts m.url end
    mock = matching_mocks.find do |mock|
      JSON.parse(mock.query) == query_params and
      JSON.parse(mock.body) == body
    end
    mock.nil? ?  {status: 404, response: {}} : {status: 200, response: mock.result }
  end
end