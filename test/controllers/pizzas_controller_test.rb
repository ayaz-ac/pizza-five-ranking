# frozen_string_literal: true

require 'test_helper'

class PizzasControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get pizzas_url
    assert_response :success
  end
end
