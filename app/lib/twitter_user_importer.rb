class TwitterUserImporter
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def get_tweeps
    twitter_api = TwitterApi.new(@user.token, @user.secret)
    twitter_api.tweep_ids
  end

  def import_tweeps
    get_tweeps.each do |tweep|
      # actually save it here
    end
  end

end