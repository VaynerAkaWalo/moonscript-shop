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

