class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: '854d85803959e8fb77b2b88794e633960044e6fd')
  end

  def call
    @client.create_gist(gist_params)
  end

  def created?
    @client.last_response.status == 201
  end

  def url
    @client.last_response.data[:html_url]
  end

  private

  def gist_params
    {
      description: I18n.t('gist_description', title: @test.title),
      public: true,
      files: {
        I18n.t('gist_filename') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
