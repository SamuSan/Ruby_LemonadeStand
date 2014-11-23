class Message_template
  def show_user_market_prices(lemon_price:, sugar_price:)
    "Today's prices: Lemons: #{lemon_price}c each.\nSugar: #{sugar_price}c each"
  end

  def prompt_for_lemons_order
    "Please make you lemons order for the day: "
  end

  def prompt_for_sugar_order
    "Please make your sugar order for the day: "
  end

  def prompt_for_lemonade_price
    "Please enter the lemonade price for today: "
  end

  def weather_report(temperature)
    "Today's forecasted temperature is : #{temperature}"
  end
end