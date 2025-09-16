library(httr2)

date <- Sys.Date() - 1

if (!dir.exists("data")) dir.create("data")

req <- request("https://newsapi.org/v2/everything") |>
  req_url_query(
    q = '`"data science"`',
    from = date,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )

req_perform(req, path = paste0("data/", date, ".json"))
