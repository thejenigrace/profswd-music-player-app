class TempUpload < ActiveRecord::Base
    
     mount_uploader :song, SongUploader
end
