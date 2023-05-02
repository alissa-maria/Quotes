using Genie.Router, GenieAuthentication, Quotes.QuotesController

route("/", QuotesController.index, named=:home)

route("/create_quote", QuotesController.create, method=POST, named=:create_quote)
