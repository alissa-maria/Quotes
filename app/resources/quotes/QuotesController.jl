module QuotesController

using Genie.Renderer.Html, Genie.Requests, SearchLight, GenieAuthentication, Quotes.Quotes, Dates
import Markdown

function index()
  authenticated!()
  html(:quotes, :index)
end

function create()
  authenticated!()

  san_type::String = sanitize(postpayload(:type))
  san_quote::String = sanitize(postpayload(:quote))
  san_from::String = sanitize(postpayload(:from))
  san_context::String = sanitize(postpayload(:context))
  san_date::String = sanitize(postpayload(:date))

  Quote(type=san_type, quote_=san_quote, name=san_from, context=san_context, date=san_date, submitted_date=Dates.today()) |> save && redirect("/")
end

function sanitize(text::String)
  Markdown.htmlesc(text) |> strip
end

end
