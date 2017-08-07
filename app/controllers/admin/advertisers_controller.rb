module Admin
  class AdvertisersController < Admin::ApplicationController
    def index
      @advertisers = Advertiser.all
      if params[:q].present?
        qstr = "%#{params[:q].downcase}%"
        @advertisers = @advertisers.where("lower(name) LIKE ? or lower(name) LIKE ?", qstr, qstr)
      end
      # if params[:type].present?
      #   @advertisers = @advertisers.where(type: params[:type])
      # end
      @advertisers = @advertisers.order(id: :desc).page(params[:page])
    end

    def show
      @advertiser = Advertiser.find(params[:id])
    end

    def new
      @advertiser = Advertiser.new
      # @advertiser._id = nil
    end

    def edit
      @advertiser = Advertiser.find(params[:id])
    end

    def create
      @advertiser = Advertiser.new(params[:advertiser].permit!)
      @advertiser.name = params[:advertiser][:name]
      @advertiser.company = params[:advertiser][:company]
      @advertiser.reward = params[:advertiser][:reward]
      @advertiser.rule = params[:advertiser][:rule]
      @advertiser.guide = params[:advertiser][:guide]
      # @advertiser.banner_url = "#{Setting.domain}/#{@advertiser.banner_url}"
      if @advertiser.save
        redirect_to(admin_advertisers_path, notice: "advertiser was successfully created.")
      else
        render action: "new"
      end
    end

    def update
      @advertiser = Advertiser.find(params[:id])
      @advertiser.name = params[:advertiser][:name]
      @advertiser.company = params[:advertiser][:company]
      @advertiser.reward = params[:advertiser][:reward]
      @advertiser.rule = params[:advertiser][:rule]
      @advertiser.guide = params[:advertiser][:guide]

      if @advertiser.update(params[:advertiser].permit!)
        redirect_to(edit_admin_advertiser_path(@advertiser.id), notice: "advertiser was successfully updated.")
      else
        render action: "edit"
      end
    end

    def visit_info
      @advertiser = Advertiser.find(params[:id])
      @visit_logs = @advertiser.visit_logs.page(page)
      render action: "visit_info"
    end

    def visit_audit
      visit_log = VisitLog.find(params[:log_id])
      ActiveRecord::Base.transaction do
        user_account = visit_log.user.user_account
        user_account_record = visit_log.user_account_records.new
        user_account_record.user_id = visit_log.user_id
        user_account_record.change_amount = visit_log.reward_amount
        user_account_record.from_amount = user_account.amount
        user_account_record.to_amount = user_account.amount + visit_log.reward_amount
        user_account_record.in_or_out=1
        user_account_record.save!
        user_account.amount = user_account.amount + visit_log.reward_amount
        user_account.save!
        visit_log.status=1
        visit_log.deal_uid=current_user.id
        visit_log.deal_name=current_user.name
        visit_log.deal_at=Time.now()
        visit_log.save!
      end
      redirect_to(visit_info_admin_advertiser_path(params[:id]))
    end

    def destroy
      @advertiser = Advertiser.find(params[:id])
      # if @user.user_type == :user
      #   @user.soft_delete
      # else
      @advertiser.destroy
      redirect_to(admin_advertisers_path)
    end
  end

end
