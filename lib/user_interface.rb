require_relative 'message_template'
class UserInterface

  def initialize(lemonade_stand_app:)
    @message_template = Message_template.new
    @lemonade_stand_app = lemonade_stand_app
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

  def give_weather_report
    puts @message_template.weather_report(@lemonade_stand_app.lifecycle.todays_temperature)
  end
end