class Action
  attr_reader :player, :game, :event

  def initialize(player, game, event)
    @player = player
    @game   = game
    @event  = event

    choose_action
  end

  private

  def choose_action
    num = rand(0...6)
    action = 
      if 0 === num
        Exploration
      elsif (1..2) === num && player.item?
        Murder
      elsif (2..3) === num && !player.item?
        FindItem
      elsif 4 === num && game.turn_num >= 2 && game.living_players.count > 2
        PveDeath
      else
        Leisure
      end

    action.new(player, game, event).perform
  end
end