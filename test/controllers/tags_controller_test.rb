require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
    
  test "should go to new tag form" do
    get new_author_quotes_tag_path(author_id:1, quotes_id:1)

    assert_response :success 
  end 

  test "should create tag" do
    post create_author_quotes_tag_path(author_id:1, quotes_id:1), params: {tags: {name: 'tag_name'}}  
    assert_response :redirect
  end

  test "should go to tag details form" do
    get '/authors/1/quotes/1/tag/1'
    assert_recognizes({ :controller => 'tags',
                        :action => 'show',
                        :id => '1',
                        :author_id => '1',
                        :quotes_id => '1' },
                        :path => '/authors/1/quotes/1/tag/1',
                        :method => :get)
  end

  test "should update the tag  in tag details form" do
    get '/authors/1/quotes/1/tag/1'
    assert_recognizes({ :controller => 'tags',
                        :action => 'update',
                        :id => '1' ,
                        :author_id => '1',
                        :quotes_id => '1' },
                        :path => '/authors/1/quotes/1/tag/1',
                        :method => :patch)
    assert_response :success
  end

  test "should delete the tag  in tag details form" do
    get '/authors/1/quotes/1/tag/1'
    assert_recognizes({ :controller => 'tags',
                        :action => 'destroy',
                        :id => '1',
                        :author_id => '1',
                        :quotes_id => '1' },
                        :path => '/authors/1/quotes/1/tag/1',
                        :method => :delete)
    assert_response :success
  end
end 
