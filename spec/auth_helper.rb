module AuthHelper
  def http_login
    name = 'shop'
    password = '1234'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(name,password)
  end
end
