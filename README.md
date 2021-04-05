# Auctane Ex - Elixir Application for Auctane features

This application is setup as an umbrella application, to allow for ease of future development. It is divided by layer into (1,2).

## OS/package dependencies
Assumes you have `Elixir 1.11.4` with `OTP 23.2.3`. One can isolate this project's packages using `asdf` with the `.tool-versions` file.
See: https://asdf-vm.com/#/core-manage-asdf

## Application Setup
1. Run `mix deps.get`
1. Run `mix compile`
1. Note the available tasks under each app, E.g.

## General Information
- To view the project documentation run `mix docs` and view the output in the /docs folder
**TODO: Add description**

## Testing
- Ensure your shell session/environment has a path variable set for the API key for testing, `export TEST_SHIP_ENGINE_API_KEY=XXXX` or in a `.env` file if you are using a setup like Docker.
- To run unit tests, run `MIX_ENV=test mix test` or Ensure your shell session/environment has a path variable set, `MIX_ENV=test` and run `mix test`.
- To run static code analysis using credo, run `mix credo --strict`.
- To run the mix code formatter, run `mix format --check-formatted` (or ensure you have run `mix format` to ensure your files are formatted to avoid any errors with the check).

See also: https://github.com/christopheradams/elixir_style_guide#comments
https://chris.beams.io/posts/git-commit/
