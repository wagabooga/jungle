class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_LOGIN"], password: ENV["ADMIN_PASS"]
  def show
    @product_count = Product.count(:all)
    @category_count = Category.count(:all)
  end
end
