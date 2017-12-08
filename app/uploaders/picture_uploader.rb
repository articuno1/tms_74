class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: Settings.warning.limit
  storage :file

  def store_dir
    "upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url *_args
    ActionController::Base.helpers.asset_path("avatardefault/" +
      [version_name, Settings.image_default].compact.join("_"))
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
