# frozen_string_literal: true

class BasketWithGoods
  def initialize(tax = 0)
    @basket = {}
    @total = 0
    @tax = tax
  end

  def fill_with_goods
    loop do
      puts 'Type in product name:'
      product = gets.chomp
      break if product.casecmp('stop').zero?

      puts "Type in price for #{product}:"
      price = gets.chomp.to_i
      puts "Type in quantity of #{product}:"
      quantity = gets.chomp.to_i
      product_total = price * quantity
      @basket[product] = { price: price, quantity: quantity, product_total: product_total }
      @total += product_total
    end
  end

  def show_goods
    @basket.each do |product, price_information|
      puts %(
      ____________________________________________________________________
      #{product}:
      price for each item: #{price_information[:price]},
      quantity of #{product}: #{price_information[:quantity]},
      total price for #{product}: #{price_information[:product_total]}
      ____________________________________________________________________
      )
    end

    puts "Total price for your goods: #{@total}"
  end
end
