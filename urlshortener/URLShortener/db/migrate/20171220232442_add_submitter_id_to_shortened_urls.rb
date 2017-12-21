class AddSubmitterIdToShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :shortened_urls, :submitter_id, :integer, null: false
  end
end
