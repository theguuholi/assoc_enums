# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :assoc_enums,
  ecto_repos: [AssocEnums.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :assoc_enums, AssocEnumsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "43CjvCyCbKNqgihU4XsmLUIEk2uMvbFyX7Lia/trQNYLVB0OonLRx69OPlUrNQ11",
  render_errors: [view: AssocEnumsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AssocEnums.PubSub,
  live_view: [signing_salt: "ujDlT+Se"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
