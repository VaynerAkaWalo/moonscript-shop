lapis = require "lapis"
import respond_to, json_params from require "lapis.application"
import Categories, Products from require "models"

class extends lapis.Application
  [categories: "/categories"]: respond_to {
    GET: =>
      categories = Categories\select!
      json: [category for category in *categories]

    POST: json_params =>
      category = Categories\create @params
      json: category
  }

  [category: "/categories/:id"]: respond_to {
      GET: =>
        category = Categories\find @params.id
        json: category

      PUT: json_params =>
        category = Categories\find @params
        category\update @params
        json: category

      DELETE: json_params =>
        category = Categories\find @params
        category\delete!
        json: { deleted: @params.id }
  }

  [products: "/products"]: respond_to {
      GET: =>
        products = Products\select!
        json: [product for product in *products]

      POST: json_params =>
        product = Products\create @params
        json: product
    }

    [product: "/products/:id"]: respond_to {
        GET: =>
          product = Products\find @params.id
          json: product

        PUT: json_params =>
          product = Products\find @params
          product\update @params
          json: product

        DELETE: json_params =>
          product = Products\find @params
          product\delete!
          json: { deleted: @params.id }
    }


