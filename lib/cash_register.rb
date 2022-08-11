require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += price * quantity
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        return "There is no discount to apply." if self.discount == 0
        self.total *= 1 - (self.discount/100.to_f)
        return "After the discount, the total comes to $#{self.total.to_i}." 
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end
