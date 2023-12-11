module QuotesController

using Genie.Renderer.Html, Genie.Requests, Genie.Exceptions, GenieAuthentication, GenieAuthentication.GenieSession.Flash, SearchLight, Dates
using ..Main.UserApp.GenieAuthenticationViewHelper, ..Main.UserApp.Quotes
import Markdown

function form()
  authenticated!()
  html(:quotes, :form, context = @__MODULE__)
end

function save_quote(quote_, success_message, error_message)
  if save(quote_)
    flash(success_message)
    redirect(:home)
  else
    flash(error_message)
    throw(ExceptionalResponse(redirect(:home)))
  end
end

function create_or_update(id = nothing)
  authenticated!()

  san_type::String = sanitize(postpayload(:type))
  san_quote::String = sanitize(postpayload(:quote))
  san_from::String = sanitize(postpayload(:from))
  san_context::String = sanitize(postpayload(:context))
  san_date::String = sanitize(postpayload(:date))

  if isnothing(id)
    quote_ = Quote(type=san_type, quote_=san_quote, name=san_from, context=san_context, date=san_date)
    save_quote(quote_, "Citaat geplaatst! ヽ(⌒▽⌒)ﾉ ", "Er is iets misgegaan, het citaat is niet geplaatst. ")
  else
    quote_ = get(Quote, id)
    quote_.type = san_type
    quote_.quote_ = san_quote
    quote_.name = san_from
    quote_.context = san_context
    quote_.date = san_date
    save_quote(quote_, "Citaat bijgewerkt! ヽ(⌒▽⌒)ﾉ ", "Er is iets misgegaan, het citaat is niet bijgewerkt. ")
  end
end

function create()
  create_or_update()
end

function update(id)
  create_or_update(id)
end

function index()
  authenticated!()
  quotes = all(Quote, order=SQLOrder(:date, "DESC"))
  html(:quotes, :index, quotes = quotes, context = @__MODULE__)
end

function edit(id)
  authenticated!()
  quote_ = get(Quote, id)
  html(:quotes, :edit, quote_ = quote_, context = @__MODULE__)
end

function delete(id)
  authenticated!()
  quote_ = get(Quote, id)

  if delete!(quote_)
    flash("Citaat verwijderd! (｡♥‿♥｡) ")
    redirect(:home)
  else
    flash("Er is iets misgegaan, het citaat is niet verwijderd. ")
    throw(ExceptionalResponse(redirect(:home)))
  end
end

function sanitize(text::String)
  Markdown.htmlesc(text) |> strip
end

end
