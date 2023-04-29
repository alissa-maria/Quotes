(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Quotes
const UserApp = Quotes
Quotes.main()
