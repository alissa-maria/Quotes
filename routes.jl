using Genie.Router, GenieAuthentication, Quotes.QuotesController

route("/", QuotesController.form, named=:home)

route("/create_quote", QuotesController.create, method=POST, named=:create_quote)

route("/index", QuotesController.index, named=:index)

route("/edit/:id") do
    QuotesController.edit(:id)
end
