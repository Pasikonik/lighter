CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage :file
  else
    config.storage :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['LIGHT_S3_ID'],
      aws_secret_access_key: ENV['LIGHT_S3_KEY'],
      region: 'eu-central-1'
    }
    if Rails.env.development?
      config.fog_directory = ENV['LIGHT_S3_BUCKETS_DEV']
    elsif Rails.env.production?
      config.fog_directory = ENV['LIGHT_S3_BUCKETS_DEV']
    end
  end
end
