CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS', # required
      :aws_access_key_id      => 'AKIAJYEZOQ7YSKG5GSCQ',  # required
      :aws_secret_access_key  => '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',  # required
      :region                 => 'ap-southwest-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'profswd-song-storage' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3

  # for more optional configuration
  config.will_include_content_type  = true
  config.max_file_size              = 15.megabytes # defaults to 5.megabytes
  config.default_content_type       = 'audio/mpeg'
  config.allowed_content_types      = %w(audio/mpeg audio/mp4)
end