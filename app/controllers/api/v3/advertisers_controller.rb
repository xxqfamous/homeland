module Api
  module V3
    class AdvertisersController < Api::V3::ApplicationController
      before_action :doorkeeper_authorize!, only: [:to_url]
      # before_action :set_user, except: [:index, :me]

      # 获取广告商列表
      #
      # GET /api/v3/advertisers
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
        @advertisers = Advertiser.where(:status => 1).page(page)
        # @advertisers = Advertiser.where(:status => 1).offset(params[:offset]).limit(params[:limit])
      end


      # 获取某个广告商的详细信息
      #
      # GET /api/v3/advertisers/:id
      # @return [advertisersSerializer]
      def show
        @meta = {followed: false, blocked: false}
        @advertiser = Advertiser.find(params[:id])
        @advertiser.increment!(:visits_count)
      end

      # 创建新话题
      #
      # POST /api/v3/advertisers
      #
      # @param name [String] 标题, [required]
      # @param company [Integer] 节点编号, [required]
      # @param company_info [Markdown] 格式的正文, [required]
      # @return [advertisersSerializer]
      def create
        # requires! :name
        # requires! :company

        # raise AccessDenied.new("当前用户没有权限，具体请参考官网的相关说明。") unless can?(:create, Advertiser)

        @advertiser = Advertiser.new(advertiser_params)
        @advertiser.status = 1
        @advertiser.save!

        render "show"
      end


      def to_url
        @advertiser = Advertiser.find(params[:id])
        url = "#"
        if !@advertiser.nil?
          url =@advertiser.url
          VisitLogJob.perform_later(current_user.id, @advertiser.reward_amount, @advertiser.id, "Advertiser")
        end

        redirect_to url
      end


      private

      def set_user
        @user = User.find_by_login!(params[:id])
      end

      def advertiser_params
        params.require(:advertiser).permit(:name, :company, :status)
      end
    end
  end
end
