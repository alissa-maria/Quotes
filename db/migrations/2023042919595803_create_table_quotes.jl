module CreateTableQuotes

import SearchLight.Migrations: create_table, column, columns, pk, drop_table

function up()
  create_table(:quotes) do
    [
      pk()
      column(:type, :string, not_null = true)
      column(:quote_, limit = 512, :string, not_null = true)
      column(:name, limit = 64, :string)
      column(:context, limit = 256, :string)
      column(:date, :date, not_null = true)
      column(:submitted_date, :date, not_null = true)
    ]
  end
end

function down()
  drop_table(:quotes)
end

end
