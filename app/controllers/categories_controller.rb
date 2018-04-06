# frozen_string_literal: true

# Provides landing page action
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
end
