class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_name = req.path.split("/").last
      found_item_price = search_item(item_name)
      # binding.pry
      if found_item_price
        resp.status = 200
        resp.write found_item_price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

  def search_item(item_name)
    result = Item.all.find do |item|
      item.name == item_name
    end
    if result
      return result.price
    else
      return nil
    end
  end

end
