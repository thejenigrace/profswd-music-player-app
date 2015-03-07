class ApplicationController < ActionController::Base
  # Configuration for AWS-SDK
  client = Aws::S3::Client.new(
      access_key_id: 'AKIAJYEZOQ7YSKG5GSCQ',
      secret_access_key: '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',
      region: 'ap-southeast-1'
  )

  RESOURCE = Aws::S3::Resource.new(client: client)
  BUCKET_NAME =  "profswd-song-storage"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
