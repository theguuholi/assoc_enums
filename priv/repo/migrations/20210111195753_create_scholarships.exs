defmodule AssocEnums.Repo.Migrations.CreateScholarships do
  use Ecto.Migration

  def change do
    create table(:scholarships, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :full_price, :decimal
      add :price_with_discount, :decimal
      add :discount_percentage, :decimal
      add :enrollment_semester, :string
      add :enabled, :boolean, default: false, null: false
      add :course_id, references(:courses, nilify_all: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:scholarships, [:course_id])
  end
end
