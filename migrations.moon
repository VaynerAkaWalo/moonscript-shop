import create_table, add_column, drop_table from require "lapis.db.schema"

{
  [1]: =>
    create_table "categories", {
      { "id", "serial", primary_key: true }
      { "name", "varchar(255)", unique: true, null: false }
      { "created_at", "timestamp", default: "now()" }
      { "updated_at", "timestamp", default: "now()" }
    }

  [2]: =>
      create_table "products", {
        { "id", "serial", primary_key: true }
        { "name", "varchar(255)", unique: true, null: false }
        { "category_id", "integer", references: "categories(id)" }
        { "created_at", "timestamp", default: "now()" }
        { "updated_at", "timestamp", default: "now()" }
      }
}
