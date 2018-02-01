module MockService
  def find_mocked_result(url, query_params, body, mock_server_id, method)
    matching_mocks = Mock.where(
                          mock_server_id: mock_server_id,
                          url: url,
                          method: method)
    puts "-"*100
    puts url, mock_server_id, method
    matching_mocks.map do |m| puts m.url end
    puts "-"*100
    mock = matching_mocks.find do |mock|
      puts "*"*100
      puts mock.query
      puts "*"*100
      puts query_params
      puts "*"*100
      (query_params.nil? and mock.query.nil? ) or JSON.parse(mock.query) == query_params
      (body.nil? and mock.body.nil?) or JSON.parse(mock.body) == body
    end
    mock.nil? ?  {status: 404, response: {}} : {status: 200, response: mock.result }
  end
end