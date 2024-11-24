require 'cloudinary'
require 'carrierwave'
require 'carrierwave/storage/cloudinary'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :cloudinary
    config.cloudinary_config = {
      cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
      api_key:    ENV['CLOUDINARY_API_KEY'],
      api_secret: ENV['CLOUDINARY_API_SECRET']
    }
  end
end