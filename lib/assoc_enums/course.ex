defmodule AssocEnums.Course do
  use Ecto.Schema
  import Ecto.Changeset
  alias AssocEnums.Campus
  alias AssocEnums.Scholarship

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "courses" do
    field :kind, :string
    field :level, :string
    field :name, :string
    field :shift, :string
    # field :campus_id, :binary_id
    belongs_to :campus, Campus, foreign_key: :campus_id, type: :binary_id
    has_many :scholarships, Scholarship

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name, :kind, :level, :shift])
    |> cast_assoc(:scholarships, with: &Scholarship.changeset/2)
    |> validate_required([:name, :kind, :level, :shift])
  end
end
