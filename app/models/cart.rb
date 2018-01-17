class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user


  def add_item(item)
    line_item = LineItem.find_by(cart_id: self.id, item_id: item)
    if line_item
      line_item.update(quantity: line_item.quantity + 1)
    else
      line_item = LineItem.new(quantity: 1, cart_id: self.id, item_id: item)
    end
    line_item
  end

  def total
    line_items.collect do |line_item|
      line_item.subtotal
    end.sum
  end

end
