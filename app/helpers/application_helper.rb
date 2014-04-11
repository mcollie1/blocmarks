module ApplicationHelper
  def url_helper(url)
    bookmark = url.bookmark
    [bookmark, url]
  end
end
