class ReceiptUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
