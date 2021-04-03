# Auctane Ex - Elixir Application for Auctane features

This application is setup as an umbrella application, to allow for ease of future development. It is divided by layer into (1,2).

## OS/package dependencies
Assumes X, or to isolate i this project, use asdf ...

## Application Setup
1. Run `mix deps.get`
1. Run `mix compile`
1. Note the available tasks under each app, E.g.

## General Information
- To view the project documentation run `mix docs` and view the output in the /docs folder
**TODO: Add description**

## Testing
- To run unit tests, run `mix test`.
- To run static code analysis using credo, run `mix credo --strict`.
- To run the mix code formatter, run `mix format --check-formatted` (or ensure you have run `mix format` to ensure your files are formatted to avoid any errors with the check).

## Configuration
Copy the .env_example file, and rename to .env and update with your local values.
