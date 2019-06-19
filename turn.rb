class Turn
  attr_reader :game, :event

  def initialize(game, event)
    @game = game
    @event = event

    increase_game_turn
    player_turns
    play_cannon
    report_deaths
    display_living_players
    end_turn
  end
  
  private

  def increase_game_turn
    game.turn_num += 1
    event.respond "**------ TURN #{game.turn_num} ------**"
  end
  
  def player_turns
    game.players.each { |player|
      Player::Turn.new player, game, event
    }
  end

  def play_cannon
    death_count = deaths.length

    if death_count > 0
      event.respond "#{death_count} cannon #{'shot'.pluralize(death_count)} can be heard in the distance."
    end
  end

  def report_deaths
    deaths.each { |death| event.respond "RIP #{death}" }
  end

  def display_living_players
    if game.living_players.count == game.players.count
      event.respond "Everyone survived the night!"
    else
      event.respond "Still alive: #{game.living_players.to_sentence}."
    end
  end

  def end_turn
    event.respond 'Use `!hg next` to proceed to the next turn.'
  end

  def deaths
    game.turn_deaths
  end
end