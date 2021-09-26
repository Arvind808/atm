require 'test_helper'

class AmountConversionsControllerTest < ActionDispatch::IntegrationTest
  test 'should invalid error' do
    get amount_conversion_path(input_amount: -10), as: :json

    assert_response 422
  end

  test 'should show amount_conversions when amount 41' do
    get amount_conversion_path(input_amount: 41), as: :json

    assert_response :success
    assert_equal({ 'quarter' => 1, 'dime' => 1, 'nickel' => 1, 'penny' => 1 }, response.parsed_body)
  end

  test 'should show amount_conversions when ammount 25' do
    get amount_conversion_path(input_amount: 25), as: :json

    assert_response :success
    assert_equal({ 'quarter' => 1 }, response.parsed_body)
  end
end
