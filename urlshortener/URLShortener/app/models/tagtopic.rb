class Tagtopic < ApplicationRecord
  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging


    has_many :urls,
    through: :taggings,
    source: :urls



def popular_links

  urls.sort do |first,second|

    second.num_clicks <=> first.num_clicks
  end.take(5)

end




end
