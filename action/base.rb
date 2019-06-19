class Action::Base
  attr_reader :player, :game, :event

  def initialize(player, game, event)
    @player = player
    @game   = game
    @event  = event
  end

  def perform
    respond "#{player} #{self.class.const_get(:TEXTS).sample}."
  end

  private

  def other_player
    @other_player ||= game.other_players(player).sample
  end

  def respond(message)
    event.respond(":#{self.class.const_get(:ICON)}: #{message}")
  end
end