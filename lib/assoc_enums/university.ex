defmodule AssocEnums.University do
  use Ecto.Schema
  import Ecto.Changeset
  alias AssocEnums.Campus

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "universities" do
    field :logo_url, :string
    field :name, :string
    field :score, :decimal

    has_many :campus, Campus

    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [:logo_url, :name, :score])
    |> cast_assoc(:campus, with: &Campus.changeset/2)
    |> validate_required([:logo_url, :name, :score])
  end
end
