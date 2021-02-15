# frozen_string_literal: true

module CustomHelpers
  def clean_summary(article)
    article.summary.gsub(%r{</?[^>]*>}, '').gsub("\n", ' ').strip
  end

  def social_share_url(article)
    id = article.data.id
    "https://www.fortyeven.com/images/post-#{id}/social-share.png"
  end
end
