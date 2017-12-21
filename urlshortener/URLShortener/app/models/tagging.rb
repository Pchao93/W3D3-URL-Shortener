class Tagging < ApplicationRecord
  belongs_to :urls,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl


    belongs_to :tags,
      primary_key: :id,
      foreign_key: :tag_id,
      class_name: :TagTopic





end
