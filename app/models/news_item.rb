# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  # has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def self.articles(article_info)
    @articles = article_info
    # article_info['articles'].each_with_index do |article, index|
    #   @articles[index] = [article['title'], article['description'], article['url']]
    # end
  end
end
