# Quotes

Small, possibly over-engineered project for my friend group to submit out of context quotes. Will be polishing it along the way.

## Build

Building the app happens in the Julia REPL:

```bash
export GENIE_ENV=prod # default is dev
bin/repl
```

```julia
import Pkg
Pkg.instantiate()
using Genie
Genie.Generator.write_secrets_file()
using Searchlight
SearchLight.Migration.init()
SearchLight.Migration.all_up!!()
using Quotes.AuthenticationController
AuthenticationController.add_user(user="general", password="change_me!")
```

## Run

Start the server with `bin/server`. Pay attention to what Genie environment you're in (`dev` or `prod`).
