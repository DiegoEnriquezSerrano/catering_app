# First, require the helper module
require 'devise/jwt/test_helpers'

# ...

  it 'tests something' do
    user = fetch_my_user()
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # This will add a valid token for `user` in the `Authorization` header
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)

    get '/my/end_point', headers: auth_headers

    expect_something()
  end