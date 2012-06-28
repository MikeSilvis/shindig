class AddGoogleShortenUrlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :google_url, :string
  end
end
