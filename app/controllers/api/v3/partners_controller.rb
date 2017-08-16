module Api
  module V3
    class PartnersController < Api::V3::ApplicationController
      before_action :doorkeeper_authorize!, only: [:to_url]

      # 获取广告商列表
      #
      # GET /api/v3/partners
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
        hot = params["hot"].blank? ? [0, 1] : params["hot"]
        @partners = Partner.where(:status => 1).where(:hot => hot).order(sort: :asc).page(page)
        # @partners = Partner.where(:status => 1).offset(params[:offset]).limit(params[:limit])
      end


      # 获取某个广告商的详细信息
      #
      # GET /api/v3/partners/:id
      # @return [partnersSerializer]
      def show
        @meta = {followed: false, blocked: false}
        @partner = Partner.find(params[:id])
        @partner.increment!(:visits_count)
      end


      def to_url
        @partner = Partner.find(params[:id])
        url = "#"
        if !@partner.nil?
          url =@partner.url
          VisitLogJob.perform_later(current_user.id, @partner.reward_amount, @partner.id, @partner.class.name)
        end

        redirect_to url
      end


    end
  end
end
