class Banner < ApplicationRecord

  # attr_accessor :img_url

  mount_uploader :img, BannerUploader


  def as_json(_options = {})
    {
        id: self.id,
        title: self.title,
        href: self.href,
        sort: self.sort,
        img_url: self.img.url
    }
  end
end
