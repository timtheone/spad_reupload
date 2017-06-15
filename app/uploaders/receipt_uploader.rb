class ReceiptUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick



  version :standart_transform do
    cloudinary_transformation width: 600, crop: :limit, format: 'jpg'
  end

end
