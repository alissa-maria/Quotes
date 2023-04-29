using Genie.Router, GenieAuthentication, Quotes.QuotesController

route("/") do #; authenticated!()
  QuotesController.index()
end

route("/create_quote", QuotesController.create, method = POST, named = :create_quote)
