module QuotesController

using Genie.Renderer.Html, Genie.Requests, SearchLight, Quotes.Quotes
import Markdown

function index()
  html(:quotes, :index)
end

function create()
  san_quote::String = sanitize(postpayload(:quote))
  san_from::String = sanitize(postpayload(:from))
  san_date::String = sanitize(postpayload(:date))

  Quote(quote_=san_quote, name=san_from, date=san_date) |> save && redirect("/")
end

function sanitize(text::String)
  Markdown.htmlesc(text) |> strip
end

end
