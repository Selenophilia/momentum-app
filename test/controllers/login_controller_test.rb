require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user       =  User.create(username: "user", email: "user_eemail@email.com",
                                 password: "examplepassword", admin: false)
    end
  
  test "should not go to index page if log in form is empty" do
    user = User.create(username: "", password:"")
    assert_not user.save, "username and password should not be blank"
  end

  test "should not go to index page if username field is empty" do
    user = User.create(username: " ", password:"example_password")
    assert_not user.save, "Username field is empty"
  end

  test "should not go to index page if password field is empty" do
    user = User.create(username: "example_user", password:"example_password")
    assert_not user.save, "Password field is empty"
  end

  test "should go to login  form" do
    get '/login' 
    assert_recognizes({ :controller => 'login',
                        :action => 'new'},
                        :path => '/login',
                        :method => :get)
  end
  
  test "should go to index form after login" do
    login_user_test(@user)
  end

  test "can see the welcome page" do
    get "/index"
    assert_response :success
  end

end
