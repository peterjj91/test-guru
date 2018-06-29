class GitHubClient

  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = 'f6723950e0c08579b3099db9bc051a79a942222c'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private 

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end