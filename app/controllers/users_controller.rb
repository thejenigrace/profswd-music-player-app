# Global Variables
$key = 'initialize'

class UsersController < ApplicationController
  before_action :require_login

  def index
    @songs = RESOURCE::bucket(BUCKET_NAME).objects

    user_id = User.where(id: session[:user_id]).first
    if(!user_id.nil?)
      @name_of_user = user_id.name
    end

    @allPlaylist = Playlist.all
    @session_id = session[:user_id]

    upload_song
    change_playlist
  end

  def create_playlist
    @playlist = Playlist.new
    @playlist.user_id = session[:user_id]
    @playlist.title = params[:playlist_title]
    @playlist.save

    redirect_to home_path
  end

  def change_playlist
    @chosen_playlist_id = params[:my_playlist]
    @playlist_songs = Song.where(:playlist_id => @chosen_playlist_id)

    if(params[:my_playlist].present?)
      @current_playlist = Playlist.where(:id => params[:my_playlist]).first.title
    end
  end

  def edit_playlist
    @ePlaylist = Playlist.find(params[:edit_this_playlist])
    # @ePlaylist.title = params[:edit_playlist_title]
    # @ePlaylist.save
    @ePlaylist.update(title: params[:edit_playlist_title])

    redirect_to home_path
  end

  def upload_song
    @uploader = TempUpload.new.song
    @uploader.success_action_redirect = home_url

    if(params[:key].present?)
      $key = params[:key]
    end
  end

  def upload_song_successfully
    @song = Song.new
    @song.playlist_id = params[:song_playlist]
    @song.title = params[:song_title]
    @song.artist = params[:song_artist]
    @song.key = $key

    if(@song.playlist_id.present? && @song.title.present? && @song.artist.present? && !@song.key.eql?("initialize"))
      @song.save
    end

    redirect_to home_path
  end

  private
  def sanitize_filename(file_name)
    just_filename = File.basename(file_name)
    just_filename.sub(/[^\w\.\-]/,'_')
  end

  private
  def require_login
    redirect_to login_path if session[:user_id].nil?
  end
end