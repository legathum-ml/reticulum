defmodule Ret.Repo.Migrations.CreateFilesTable do
  use Ecto.Migration

  def change do
    create table(:owned_files, primary_key: false) do
      add(:owned_file_id, :bigint, null: false, default: fragment("unique_rowid()"), primary_key: true)
      add(:owned_file_uuid, :string, null: false)
      add(:key, :string, null: false)
      add(:account_id, :bigint, null: false)
      add(:content_type, :string, null: false)
      add(:content_length, :bigint, null: false)
      add(:state, :owned_file_state, null: false, default: "active")

      timestamps()
    end

    create(index(:owned_files, [:owned_file_uuid], unique: true))
    create(index(:owned_files, [:account_id]))
  end
end
