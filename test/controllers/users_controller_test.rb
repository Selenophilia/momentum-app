require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  setup do 
      @admin_user =  User.create(username: "admin_user", email: "admin_email@email.com",
                                password: "examplepassword", admin: true)
      
      @user       =  User.create(username: "user", email: "user_eemail@email.com",
                             password: "examplepassword", admin: false)
  end

  test "should not create if username field is empty" do
    user = User.create(email: "email@email.com", username: "", password:"examplepassword")
    assert_not user.save, "Saved the user without a username"
  end

  test "should not create if email field is empty" do
    user = User.create(email: "", username: "exampleuser", password:"examplepassword")
    assert_not user.save, "Saved the user without a username"
  end

  test "should not save if password field is empty" do
    user_password = User.create(username: "exampleuser", email: "sample@email.com", password: "")
    assert_not user_password.save, "Saved the user without a password"
  end

  test "should be able to create user if user is admin" do
    assert_equal(@admin_user.admin === true,@admin_user.admin === true,"User save ")
  end 

  test "should not able to create user if not admin" do
    assert_equal(@user.admin === false, @user.admin === false,"you don't have correct access to do that! ")
  end 

  test "should not able to update user if not admin" do
    assert_equal( @user.admin === false,@user.admin === false,"you don't have correct access to do that! ")
  end 

  test "should not able to delete user if not admin" do
    assert_equal(  @user.admin === false,@user.admin === false,"you don't have correct access to do that! ")
  end 

  test "should go to new user form" do
    get new_user_path
    assert_response :success 
  end 

  test "should create user" do
    post create_user_url, params: {user: {username: 'user_user', email: 'user@email.com', password: 'password'}}  
    assert_response :redirect
  end

  test "should go to user details form" do
    get '/users/' + @user.id.to_s
    assert_recognizes({ :controller => 'users',
                        :action => 'show',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :get)
  end
  
  test "should go to update user details form" do
    get '/users/' + @user.id.to_s
    assert_recognizes({ :controller => 'users',
                        :action => 'update',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :patch)
    assert_response :redirect
  end

  test "should go delete user details form" do
    get '/users/' + @user.id.to_s
    assert_recognizes({ :controller => 'users',
                        :action => 'destroy',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :delete)
    assert_response :redirect
  end




  test "route test" do
    assert_generates "/users", :controller => "users", :action => "index"
    assert_generates "/users/new", { :controller => "users", :action => "new" }
    assert_generates "/users/1", { :controller => "users", :action => "show", :id => "1" }
    assert_generates "/users/1/edit%20", { :controller => "users", :action => "edit", :id => "1" }
    assert_generates "/users/1", { :controller => "users", :action => "update", :id => "1" }
    assert_generates "/users/1", { :controller => "users", :action => "destroy", :id => "1" }
  end

end
