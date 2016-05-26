RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def admin
      @admin = User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', is_admin: true)
  end
end
