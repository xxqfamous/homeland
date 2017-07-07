module Admin
  class ApplicationController < ::ApplicationController
    layout "admin"

    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_active_menu

    begin
      'pagination'

      def page
        params[:page] || 1
      end

      def per_page
        limit = (params[:per_page] || 20).to_i
        limit > 100 ? 100 : limit # 限制每页最多 100 条记录
      end
    end

    def require_admin
      render_404 unless current_user.admin?
    end

    def set_active_menu
      @current = ["/" + ["admin", controller_name].join("/")]
    end
  end
end
