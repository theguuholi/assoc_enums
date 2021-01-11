defmodule AssocEnums.Campus do
  use Ecto.Schema
  import Ecto.Changeset
  alias AssocEnums.University
  alias AssocEnums.Course

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "campus" do
    field :city, :string
    field :name, :string
    # field :university_id, :binary_id
    belongs_to :university, University, foreign_key: :university_id, type: :binary_id
    has_many :courses, Course

    timestamps()
  end

  @doc false
  def changeset(campus, attrs) do
    campus
    |> cast(attrs, [:name, :city])
    |> cast_assoc(:courses, with: &Course.changeset/2)
    |> validate_required([:name, :city])
  end
end
