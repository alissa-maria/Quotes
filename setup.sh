#!/bin/sh

echo "What should the webpage's password be?"
read -p 'Password: ' password

# export GENIE_ENV=prod
julia --project=. -e "import Pkg;
    Pkg.instantiate();
	using Genie.Generator;
	Genie.Generator.write_secrets_file(app_path=".");
	using Searchlight;
	SearchLight.Migration.init();
	SearchLight.Migration.all_up!!();
	using Quotes.AuthenticationController;
	AuthenticationController.add_user(\"general\", \"$password\")"
