require_relative 'message_template'
class UserInterface

  def initialize
    @message_template = Message_template.new
  end

  def show_user_market_prices(lemon_price:, sugar_price:)
    puts @message_template.show_user_market_prices(lemon_price:lemon_price, sugar_price:sugar_price)
  end

  def ask_for_lemons_order
    puts @message_template.prompt_for_lemons_order
    gets.chomp
  end

  def ask_for_sugar_order
    puts @message_template.prompt_for_lemons_order
    gets.chomp
  end

  def ask_user_for_lemonade_price
    puts @message_template.prompt_for_lemonade_price
    gets.chomp
  end

  def give_weather_report(todays_temperature)
    puts @message_template.weather_report(todays_temperature)
  end
end