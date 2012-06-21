class TwitterUserFetcher
  attr_reader :twitter_api, :blacklist_ids

  def initialize(api, blacklist_ids=[])
    @twitter_api   = api
    @blacklist_ids = blacklist_ids
  end

  def fetch
    potential_import_ids  = twitter_api.tweep_ids
    potential_import_ids -= blacklist_ids

    twitter_api.get_users(potential_import_ids) unless potential_import_ids.empty?
  end

end

