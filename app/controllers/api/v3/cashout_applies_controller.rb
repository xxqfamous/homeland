#encoding: utf-8
module Api
  module V3
    class CashoutAppliesController < Api::V3::ApplicationController
      before_action :doorkeeper_authorize!, only: [:create]

      # 提现操作
      #
      # GET /api/v3/cashout_applies
      #
      # @param limit [Integer] default: 20，range: 1..100
      # @return [Array<UserSerializer>]
      def create
        requires! :cash_account
        requires! :cash_name
        requires! :amount

        @cashout_apply = CashoutApply.new()
        @cashout_apply.user_id = current_user.id
        @cashout_apply.cash_account = params[:cash_account]
        @cashout_apply.cash_name = params[:cash_name]
        @cashout_apply.amount = params[:amount]
        @cashout_apply.status = 0
        @cashout_apply.save!

        render json: {:status => true, :msg => "提现成功"}, status: 200
      end

      private




    end
  end
end
