#encoding: utf-8
module Admin
  class BannersController < Admin::ApplicationController
    def index
      @banners = Banner.where(:status => 1).order(id: :desc).page(params[:page])
    end

    def show
      @banner = Banner.find(params[:id])
    end

    def new
      @banner = Banner.new
    end

    def edit
      @banner = Banner.find(params[:id])
    end

    def create
      @banner = Banner.new(params[:banner].permit!)
      if @banner.save
        redirect_to(admin_banners_path, notice: "banner was successfully created.")
      else
        render action: "new"
      end
    end

    def update
      @banner = Banner.find(params[:id])
      if @banner.update(params[:banner].permit!)
        redirect_to(edit_admin_banner_path(@banner.id), notice: "banner was successfully updated.")
      else
        render action: "edit"
      end
    end

    def destroy
      @banner = Banner.find(params[:id])
      @banner.destroy
      redirect_to(admin_banners_path)
    end
  end

end
