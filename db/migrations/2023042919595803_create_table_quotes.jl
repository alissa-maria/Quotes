module CreateTableQuotes

import SearchLight.Migrations: create_table, column, columns, pk, drop_table

function up()
  create_table(:quotes) do
    [
      pk()
      column(:quote_, :string, not_null = true)
      column(:name, :string)
      column(:context, :string)
      column(:date, :string, not_null = true)
    ]
  end
end

function down()
  drop_table(:quotes)
end

end
