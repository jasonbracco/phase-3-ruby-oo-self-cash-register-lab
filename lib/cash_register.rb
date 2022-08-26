class CashRegister

    attr_accessor :total, :discount, :items, :void_last_transaction

    def initialize(discount=0)
        @total=0
        @discount=discount
        @items=[]
        @void_last_transaction=[]
    end

    def add_item(title, price, quantity=1)
        if quantity>1
            @items.fill(title, @items.size, quantity)
            @void_last_transaction << (price * quantity)
        else
            @items << title
            @void_last_transaction << (price * quantity)
        end

        self.total=@total+(price*quantity)
    end

    def apply_discount
        if self.discount != 0
          discount_as_percent = (100.0 - self.discount.to_f) / 100
          self.total = (self.total * discount_as_percent).to_i
          "After the discount, the total comes to $#{self.total}."
        else
          "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total=@total-@void_last_transaction[@void_last_transaction.length-1]
    end
    

end

