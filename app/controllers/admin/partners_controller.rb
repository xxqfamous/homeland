module Admin
  class PartnersController < Admin::ApplicationController
    def index
      @partners = Partner.all
      if params[:q].present?
        qstr = "%#{params[:q].downcase}%"
        @partners = @partners.where("lower(name) LIKE ? or lower(name) LIKE ?", qstr, qstr)
      end
      # if params[:type].present?
      #   @partners = @partners.where(type: params[:type])
      # end
      @partners = @partners.order(id: :desc).page(params[:page])
    end

    def show
      @partner = Partner.find(params[:id])
    end

    def new
      @partner = Partner.new
      # @partner._id = nil
    end

    def edit
      @partner = Partner.find(params[:id])
    end

    def create
      @partner = Partner.new(params[:partner].permit!)
      @partner.name = params[:partner][:name]
      @partner.company = params[:partner][:company]
      @partner.reward = params[:partner][:reward]
      @partner.rule = params[:partner][:rule]
      @partner.guide = params[:partner][:guide]
      # @partner.banner_url = "#{Setting.domain}/#{@partner.banner_url}"
      if @partner.save
        redirect_to(admin_partners_path, notice: "partner was successfully created.")
      else
        render action: "new"
      end
    end

    def update
      @partner = Partner.find(params[:id])
      @partner.name = params[:partner][:name]
      @partner.company = params[:partner][:company]
      @partner.reward = params[:partner][:reward]
      @partner.rule = params[:partner][:rule]
      @partner.guide = params[:partner][:guide]

      if @partner.update(params[:partner].permit!)
        redirect_to(edit_admin_partner_path(@partner.id), notice: "partner was successfully updated.")
      else
        render action: "edit"
      end
    end

    def visit_info
      @partner = Partner.find(params[:id])
      @visit_logs = @partner.visit_logs.page(page)
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
      redirect_to(visit_info_admin_partner_path(params[:id]))
    end

    def destroy
      @partner = Partner.find(params[:id])
      # if @user.user_type == :user
      #   @user.soft_delete
      # else
      @partner.destroy
      redirect_to(admin_partners_path)
    end
  end

end
