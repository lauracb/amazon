require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @product = products(:one)
  end
  
  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should get create" do
    assert_difference('Product.count') do
      post products_url, params:{ product: {name: @product.name, price: @product.price, active: @product.active } }
    end
  end

  test "should get index products" do
    get products_url
    assert_response :success
  end

  test "should show products" do
    get product_url(@product)
  end

  test "should get edit" do
    get edit_product_url(@product)
  end

  test "should update product" do
    patch product_url(@product), params:{ product: {name: @product.name, price: @product.price, active: @product.active } } 
    #assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end
  end

end
