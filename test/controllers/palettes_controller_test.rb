require 'test_helper'

class PalettesControllerTest < ActionController::TestCase
  def setup
    @palette = palettes(:one)
  end

  #index
  test 'GET #index as JSON' do
    get :index, format: :json
    assert_response :success
    response_item = JSON.parse(response.body)[0]
    assert_equal @palette.name, response_item['name']
    assert_equal @palette.dom_one, response_item['dom_one']
    assert_equal @palette.dom_two, response_item['dom_two']
    assert_equal @palette.pop, response_item['pop']
    assert_equal @palette.sec_one, response_item['sec_one']
    assert_equal @palette.sec_two, response_item['sec_two']
  end

  # show
  test 'GET #show displays correct palette' do
    get :show, id: @palette.id, format: :json
    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal @palette.name, response_item['name']
    assert_equal @palette.dom_one, response_item['dom_one']
    assert_equal @palette.dom_two, response_item['dom_two']
    assert_equal @palette.pop, response_item['pop']
    assert_equal @palette.sec_one, response_item['sec_one']
    assert_equal @palette.sec_two, response_item['sec_two']
  end

  # create
  test 'POST #create' do
    post :create, palette: { name: "test name", dom_one: "dom_one", dom_two: "dom_two", pop: "pop", sec_one: "sec_one", sec_two: "sec_two" }, format: :json
    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal "test name", response_item['name']
    assert_equal "dom_one", response_item['dom_one']
    assert_equal "dom_two", response_item['dom_two']
    assert_equal "pop", response_item['pop']
    assert_equal "sec_one", response_item['sec_one']
    assert_equal "sec_two", response_item['sec_two']
  end

# update
# destroy



# test 'GET #index' do
#   get :index
#   assert_response :success
# end

end
