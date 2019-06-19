class Player::Turn
  attr_reader :player, :game, :event

  def initialize(player, game, event)
    @player = player
    @game   = game
    @event  = event

    perform_turn unless dead?
  end

  private

  delegate :dead?, to: :player

  def perform_turn
    Action.new player, game, event
  end
end