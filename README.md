# Auctane Ex - Elixir Application for Auctane features

This application is setup as an umbrella application, to allow for ease of future development. This approach was meant to focus on project structuring more than the requirements might have laid out initially.

Wherever a `NOTE:` is present, this is overly verbose commenting that would not typically go in a project, but os present to remind Nate of certain rationales and talking points.

## OS/package dependencies
This project assumes you have `Elixir 1.11.4` with `OTP 23.2.3`. One can isolate this project's packages using `asdf` with the `.tool-versions` file and `asdf` commands, such as `asdf install`.
See: https://asdf-vm.com/#/core-manage-asdf

## Application Setup
1. Run `mix deps.get`
2. Run `mix compile`
2. Run `mix docs` to generate documentation, accessible through the `doc` folder's `index.html` file.

## Running Project Tasks
This project's interface is accessed through the following three mix tasks:
1. `mix ship_engine.login`
2. `mix ship_engine.carriers`
3. `mix ship_engine.logout`

One additional feature introduced in this project is the option to not persist your login, and run a default action for fetching carriers. With the `mix ship_engine.login` command, you can enter your api key, and then choose not to persist your login and default to view all carriers and then exit without storing your login information.

NOTE: This was largely done to experiment with using an `Agent/GenServer` in the Supervisor tree for the `ship_engine_data` application.

## Testing
- Ensure your shell session/environment has a variable set for the API key for testing, e.g. `export TEST_SHIP_ENGINE_API_KEY=XXXX` or putting this in an `.env` file if you are using a setup like Docker.
- To run unit tests, run `MIX_ENV=test mix test` or ensure your shell session/environment has a variable set, `MIX_ENV=test` and run `mix test`.
- To run static code analysis using credo, run `mix credo --strict`.
- To check the mix code formatting, run `mix format --check-formatted` (or ensure you have run `mix format` to ensure your files are formatted to avoid any errors with the check).
