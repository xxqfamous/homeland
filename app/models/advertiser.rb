class Advertiser < ApplicationRecord
  paginates_per 10

  has_many :visit_logs, :as => :ownerable, :dependent => :destroy

  mount_uploader :logo_url, LogoUploader
  mount_uploader :banner_url, BannerUploader

end
