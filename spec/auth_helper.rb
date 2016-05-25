module AuthHelper
  def http_login
    name = 'admin'
    password = 'secret'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(name,password)
  end
end
