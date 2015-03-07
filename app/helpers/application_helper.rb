module ApplicationHelper
  # Configuration for AWS-SDK
  client = Aws::S3::Client.new(
      access_key_id: 'AKIAJYEZOQ7YSKG5GSCQ',
      secret_access_key: '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',
      region: 'ap-southeast-1'
  )

  RESOURCE = Aws::S3::Resource.new(client: client)
  BUCKET_NAME =  "profswd-song-storage"

  def download_song_url_for(song_key)
    RESOURCE::bucket(BUCKET_NAME).object(song_key).public_url
  end
end
