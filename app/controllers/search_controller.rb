# frozen_string_literal: true

require 'google/apis/civicinfo_v2'
require 'news-api'

class SearchController < ApplicationController
  def search
    address = params[:address]
    service = Google::Apis::CivicinfoV2::CivicInfoService.new
    service.key = Rails.application.credentials[:GOOGLE_API_KEY]
    result = service.representative_info_by_address(address: address)
    @representatives = Representative.civic_api_to_representative_params(result)
    render 'representatives/search'
  end

  def news_search
    # params[:representative_id] = params[:news_item][:representative_id]
    @new_id = params[:news_item][:representative_id]
    @representative = Representative.find(@new_id)
    @issue = params[:news_item][:issue]
    api_key = Rails.application.credentials[:NEWS_API_KEY]
    query = @representative.name and @issue
    newsapi = News.new(api_key)
    response = newsapi.get_everything(q:        query,
                                      sortBy:   'popularity',
                                      pageSize: 5,
                                      language: 'en')

    # uri = URI("https://newsapi.org/v2/everything?q=#{query}&sortBy=popularity&pageSize=5&apiKey=#{apiKey}")
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    @articles = NewsItem.articles(response)
    render 'my_news_items/search'
  end
end
