# frozen_string_literal: true

module ApplicationHelper
  def self.issues
    ['Free Speech', 'Immigration', 'Terrorism', "Social Security and
    Medicare", 'Abortion', 'Student Loans', 'Gun Control', 'Unemployment',
     'Climate Change', 'Homelessness', 'Racism', 'Tax Reform', "Net
    Neutrality", 'Religious Freedom', 'Border Security', 'Minimum Wage',
     'Equal Pay']
  end

  def self.convert(articles, index, _issue)
    str = articles[index].title
    str = "#{str}     ArticleDescription: #{articles[index].description}"
    "#{str}     ArticleURL: #{articles[index].url}"
  end

  def self.unpack(article)
    index1 = article.index('     ArticleDescription: ')
    index2 = article.index('     ArticleURL: ')
    title = article[0..index1 - 1]
    desc = article[index1 + '     ArticleDescription: '.length..index2]
    url = article[index2 + '     ArticleURL: '.length..]
    [title, desc, url]
  end

  def self.state_ids_by_name
    State.all.each_with_object({}) do |state, memo|
      memo[state.name] = state.id
    end.to_h
  end

  def self.state_symbols_by_name
    State.all.each_with_object({}) do |state, memo|
      memo[state.name] = state.symbol
    end
  end

  def self.nav_items
    [
      {
        title: 'Home',
        link:  Rails.application.routes.url_helpers.root_path
      },
      {
        title: 'Events',
        link:  Rails.application.routes.url_helpers.events_path
      },
      {
        title: 'Representatives',
        link:  Rails.application.routes.url_helpers.representatives_path
      }
    ]
  end

  def self.active(curr_controller_name, nav_link)
    nav_controller = Rails.application.routes.recognize_path(nav_link, method: :get)[:controller]
    return 'bg-primary-active' if curr_controller_name == nav_controller

    ''
  end
end
