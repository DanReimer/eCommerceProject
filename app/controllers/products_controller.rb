# frozen_string_literal: true

# Provides product viewing and searching actions
class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search], params[:category_filter])
                       .order("#{sort_column} #{sort_direction}")
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def sort_column
    Product.column_names.include?(params[:sort_by]) ? params[:sort_by] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
