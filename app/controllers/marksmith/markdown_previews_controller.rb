module Marksmith
  class MarkdownPreviewsController < ApplicationController
    def create
      @body = Marksmith::Renderer.new.renderer.render(params[:body])
    end
  end
end

