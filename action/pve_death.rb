class Action::PveDeath < Action::Base
  ICON = :snowflake

  TEXTS = [
    'walks off a cliff, hangs in midair for a moment, and falls to their death',
    'is drowned by some geese in a pond',
    'digs straight down and falls in lava',
    'freezes to death',
  ]

  def perform
    player.kill! game.turn_num
    super
  end
end