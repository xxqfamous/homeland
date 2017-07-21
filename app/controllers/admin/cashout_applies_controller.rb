#encoding: utf-8
module Admin
  class CashoutAppliesController < Admin::ApplicationController
    def index
      @cashout_applies = CashoutApply.includes(:user).where(:status => 0).order(id: :desc).page(params[:page])
    end

    def show
      @cashout_apply = CashoutApply.find(params[:id])
    end

    # def new
    #   @cashout_apply = CashoutApply.new
    # end
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
