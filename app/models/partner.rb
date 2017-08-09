class Partner < ApplicationRecord

  has_many :visit_logs, :as => :ownerable, :dependent => :destroy
  has_many :user_account_records, :as => :ownerable, :dependent => :destroy

  mount_uploader :logo_url, LogoUploader
  mount_uploader :banner_url, BannerUploader
end
