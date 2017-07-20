module Api
  module V3
    class BannersController < Api::V3::ApplicationController
      # before_action :doorkeeper_authorize!, only: [:index, :show]

      # 获取banner列表
      #
      # GET /api/v3/banners
      #
      # @param limit [Integer] default: 20，range: 1..100
      # @return [Array<UserSerializer>]
      def index
        # optional! :page, default: 1, values: 1..100
        # optional! :per_page, default: 20, values: 1..100

        # optional! :offset, default: 0
        # optional! :limit, default: 20, values: 1..150

        # limit = params[:limit].to_i
        # limit = 100 if limit > 100
        @banners = Banner.where(:status => 1).order(sort: :desc).page(page)
        render :json => {:count => @banners.count, :total_pages => @banners.total_pages, :current_page => page, :banners => @banners}
      end


    end
  end
end
