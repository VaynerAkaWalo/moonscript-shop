import Model from require "lapis.db.model"

class Products extends Model
  @timestamp: true

  @relations: {
    { "category", belongs_to: "Categories" }
  }

class Categories extends Model
  @timestamp: true

  @relations: {
    { "products", has_many: "Products" }
  }

{
  :Categories,
  :Products
}
