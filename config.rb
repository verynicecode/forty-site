# frozen_string_literal: true

set :layout, :default
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

page 'atom.xml', layout: false

activate :blog do |blog|
  blog.default_extension = '.md'
  blog.layout = 'blog'
  blog.new_article_template = File.expand_path('new_article_template.erb', File.dirname(__FILE__))
  blog.prefix = 'blog'
  blog.sources = '{year}/{month}-{day}-{title}.html'
  blog.summary_separator = /READ-MORE/
end

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :livereload
