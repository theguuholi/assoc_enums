defmodule AssocEnums.Repo do
  use Ecto.Repo,
    otp_app: :assoc_enums,
    adapter: Ecto.Adapters.Postgres
end
