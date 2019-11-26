require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product price must be positive" do
    product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.jpg")

    product.price = -1
    assert product.invalid?, "negative price of a product must be invalid."
    assert product.errors.has_key?(:price), "an invalid product must have an error"

    product.price = 0
    assert product.invalid?, "negative price of a product must be invalid."
    assert product.errors.has_key?(:price), "an invalid product must have an error"

    product.price = 1
    assert product.valid?, "positive price of a product must be valid."
    assert_empty product.errors, "a valid product must have no error"
  end
end