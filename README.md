Small project for my friend group to submit out of context quotes. Will be polishing it along the way.

Install dependencies:

```
julia --project=. -e "import Pkg; Pkg.instantiate()"
```

Initiate repl:

```
bin/repl
```

Create table in db/dev.sqlite3 (inside repl, only once):

```julia
using SearchLight
SearchLight.Migration.init()
SearchLight.Migration.lastup()
```
