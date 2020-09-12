require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author     =  Author.create(author_name: "author_sample_name")
    @quotes     =  Quote.create(description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          author_id: @author.id)  
    @admin_user =  User.create(username: "admin_user", email: "admin_email@email.com",
                               password: "examplepassword",id: 1 ,admin: true)
    @tag        =  Tag.create(name: "sample_tag")
  end

  teardown do
    Rails.cache.clear
  end


  test "should go to new quotes form" do
    login_user_test(@admin_user) 
    
    get '/authors/' +  @author.id.to_s + '/quotes/new'
   
    assert_recognizes({ :controller => 'quotes',
                        :action => 'new',
                        :author_id => '1'},
                        :path => '/authors/1/quotes/new',
                        :method => :get)
    assert_response :success
  end 

  test "should create quotes base on author id" do 
    login_user_test(@admin_user) 

    get '/authors/' +  @author.id.to_s + '/quotes'
    
    assert_recognizes({ :controller => 'quotes',
                        :action => 'create',
                        :author_id => '1' },
                        :path => '/authors/1/quotes',
                        :method => :post)
    assert_response :success
  end 



  test "should go to author details form" do
    login_user_test(@admin_user) 

    get '/authors/' +  @author.id.to_s + '/quotes/' + @quotes.id.to_s

    assert_recognizes({ :controller => 'quotes',
                        :action => 'show',
                        :author_id => '1',
                        :id => '1' },
                        :path => '/authors/1/quotes/1',
                        :method => :get)
    assert_response :success
  end
  
  test "should update quotes base on author id " do
    login_user_test(@admin_user) 

    get '/authors/' +  @author.id.to_s + '/quotes/' + @quotes.id.to_s

    assert_recognizes({ :controller => 'quotes',
                        :action => 'update',
                        :author_id => '1',
                        :id => '1' },
                        :path => '/authors/1/quotes/1',
                        :method => :patch)
    assert_response :success
  end
  
  test "should only delete quotes on specific author using quotes id " do
    login_user_test(@admin_user) 

    get '/authors/' + @author.id.to_s + '/quotes/' + @quotes.id.to_s

    assert_recognizes({ :controller => 'quotes',
                        :action => 'destroy',
                        :author_id => '1',
                        :id => '1' },
                        :path => '/authors/1/quotes/1',
                        :method => :delete)
    assert_response :success
  end


  test "should go to new quotes form and create quote when login as admin" do
    login_user_test(@admin_user) 
    get '/authors/' + @author.id.to_s + '/quotes/new'    
    assert_response :success
    assert_difference 'Quote.count', 1 do
      post create_author_quotes_url, params: { quote: {description: 'example_description', tag_ids: []}}  
            assert_response :redirect  
    end 

    follow_redirect!
    assert_response :success

  end

  test "should delete quotes when login as admin" do
    login_user_test(@admin_user) 

    assert_difference('Quote.count', -1) do
      delete delete_author_quotes_url(@quotes.author_id,@quotes.id)
    end     
  end 

end
