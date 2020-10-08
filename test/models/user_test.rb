require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "caterer user should be valid" do
    @user = User.new(first_name: "Johnny",
                     last_name: "Bravo",
                     email: "jbravo@cn.com",
                     caterer_user: true,
                     password: 'password',
                     caterer_business_name: 'carnitas round the corner',
                     caterer_business_address: '123 fake st',
                     caterer_business_city: 'chicago',
                     caterer_business_state: 'il',
                     zip_code: 60647)
    assert @user.valid?
  end

  test "customer user should be valid" do
    @user = User.new(first_name: "Johnny",
                     last_name: "Bravo",
                     email: "jbravo@cn.com",
                     caterer_user: false,
                     password: 'password')
    assert @user.valid?
  end

end
