json.array!(@work_articles) do |work_article|
  json.extract! work_article, :id, :name
  json.url work_article_url(work_article, format: :json)
end
