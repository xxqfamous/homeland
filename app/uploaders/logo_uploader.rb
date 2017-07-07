class LogoUploader < BaseUploader
  def filename
    if super.present?
      @name ||= SecureRandom.hex(3)
      "logo/#{Time.now.year}/#{@name}.#{file.extension.downcase}"
    end
  end
end
