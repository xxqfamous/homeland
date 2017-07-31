#encoding: utf-8
module Admin
  class CashoutAppliesController < Admin::ApplicationController
    def index
      @cashout_applies = CashoutApply.includes(:user).where(:status => 0).order(id: :desc).page(params[:page])
    end

    def show
      @cashout_apply = CashoutApply.find(params[:id])
    end

    def aduit
      cashout_apply = CashoutApply.find(params[:id])
      if cashout_apply.status ==0
        ActiveRecord::Base.transaction do
          user_account = cashout_apply.user.user_account
          user_account_record = cashout_apply.user_account_records.new
          user_account_record.user_id = user_account.user_id
          user_account_record.change_amount = cashout_apply.amount
          user_account_record.from_amount = user_account.amount
          user_account_record.to_amount = user_account.amount - cashout_apply.amount
          user_account_record.in_or_out=2
          user_account_record.save!
          user_account.amount = user_account.amount - cashout_apply.amount
          user_account.save!
          cashout_apply.status=1
          cashout_apply.deal_uid=current_user.id
          cashout_apply.deal_name=current_user.name
          cashout_apply.deal_at=Time.now()
          cashout_apply.save!
        end
      end
      redirect_to(admin_cashout_applies_path)
    end
    #
    # def edit
    #   @cashout_apply = CashoutApply.find(params[:id])
    # end

    # def create
    #   @cashout_apply = CashoutApply.new(params[:CashoutApply].permit!)
    #   if @cashout_apply.save
    #     redirect_to(admin_cashout_applies_path, notice: "CashoutApply was successfully created.")
    #   else
    #     render action: "new"
    #   end
    # end
    #
    # def update
    #   @cashout_apply = CashoutApply.find(params[:id])
    #   if @cashout_apply.update(params[:CashoutApply].permit!)
    #     redirect_to(edit_admin_cashout_apply_path(@cashout_apply.id), notice: "CashoutApply was successfully updated.")
    #   else
    #     render action: "edit"
    #   end
    # end
    #
    # def destroy
    #   @cashout_apply = CashoutApply.find(params[:id])
    #   @cashout_apply.destroy
    #   redirect_to(admin_cashout_applies_path)
    # end
  end

end
