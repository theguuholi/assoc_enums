defmodule AssocEnums.Scholarship do
  use Ecto.Schema
  import Ecto.Changeset

  alias AssocEnums.Course

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "scholarships" do
    field :discount_percentage, :decimal
    field :enabled, :boolean, default: false
    field :enrollment_semester, :string
    field :full_price, :decimal
    field :price_with_discount, :decimal
    # field :course_id, :binary_id
    belongs_to :course, Course, foreign_key: :course_id, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(scholarship, attrs) do
    scholarship
    |> cast(attrs, [:full_price, :price_with_discount, :discount_percentage, :enrollment_semester, :enabled])
    |> validate_required([:full_price, :price_with_discount, :discount_percentage, :enrollment_semester, :enabled])
  end
end
