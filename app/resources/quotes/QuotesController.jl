module QuotesController

using Genie.Renderer.Html, Genie.Requests, Genie.Exceptions, GenieAuthentication, GenieAuthentication.GenieSession.Flash, SearchLight, Dates
using ..Main.UserApp.GenieAuthenticationViewHelper, ..Main.UserApp.Quotes
import Markdown

function form()
  authenticated!()
  html(:quotes, :form, context = @__MODULE__)
end

function create()
  authenticated!()

  san_type::String = sanitize(postpayload(:type))
  san_quote::String = sanitize(postpayload(:quote))
  san_from::String = sanitize(postpayload(:from))
  san_context::String = sanitize(postpayload(:context))
  san_date::String = sanitize(postpayload(:date))

  submitted = Quote(type=san_type, quote_=san_quote, name=san_from, context=san_context, date=san_date) |> save

  if submitted
    flash("Citaat geplaatst! ヽ(⌒▽⌒)ﾉ ")
    redirect(:home)
  else
    flash("Er is iets misgegaan, het citaat is niet geplaatst. ")
    throw(ExceptionalResponse(redirect(:home)))
  end
end

function index()
  authenticated!()
  html(:quotes, :index, quotes = all(Quote, order=SQLOrder(:date, "DESC")), context = @__MODULE__)
end

function sanitize(text::String)
  Markdown.htmlesc(text) |> strip
end

end
