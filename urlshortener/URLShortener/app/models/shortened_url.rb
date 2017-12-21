# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ApplicationRecord
  include SecureRandom
  validates :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :unique_visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

    #tomorrow
  # has_many :recent_unique_visitors,
  #   -> { distinct },
  #   through: :visits,
  #   source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

    has_many :tags,
    through: :taggings,
    source: :tags







  def self.random_code
    short_url = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(short_url: short_url)
      short_url = SecureRandom.urlsafe_base64
    end
    short_url
  end

  def self.shorten(user, url)
    ShortenedUrl.create(short_url: ShortenedUrl.random_code, long_url: url, submitter_id: user.id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    unique_visitors.count

    # count(user_id).distinct.where('id = url_id')
  end

  def num_recent_uniques
    unique_visitors.select {|visitor| visitor.created_at > 10.hour.ago}.count
  end


end
