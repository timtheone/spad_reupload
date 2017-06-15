class ReceiptUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  version :standart do
  process :resize_to_fit => [700, 800]
  end

 version :standart_transform do
    cloudinary_transformation width: 700, crop: :scale, format: 'jpg'
  end

end
