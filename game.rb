class Game
  def self.next(event)
    if (game = ALL[event.channel.id])
      game.next!
    else
      event.respond("No game is ongoing in this channel. Start one with `!hg start {mentions...}`")
    end
  end

  def self.stop(event)
    if (game = ALL[event.channel.id])
      game.stop!
    else
      event.respond("No game is ongoing in this channel. Start one with `!hg start {mentions...}`")
    end
  end

  ALL = {}

  attr_reader :event, :channel, :players
  attr_accessor :turn_num

  def initialize(event)
    @event    = event
    @channel  = event.channel
    @turn_num = 0

    if ALL.key? channel.id
      event.respond "A game is already ongoing in this channel."
      return
    end

    mentions = event.message.mentions
    if mentions.blank? || mentions.length < CONFIG[:min_players]
      event.respond "Mention at least #{CONFIG[:min_players]} people to start the game."
      return
    end

    @players = mentions.map &Player.method(:new)
    ALL[channel.id] = self
    
    next!
  end

  def next!
    case living_players.count
    when 0
      event.respond ':confused: Nobody is left alive... this is probably a bug.'
      stop!
    when 1
      event.respond ":crown: #{living_players.first} is the winner!"
      stop!
    else
      Turn.new self, event
    end
  end

  def living_players
    players.select &:alive?
  end

  def dead_players
    players.select &:dead?
  end

  def other_players(player)
    living_players.select { |p| p != player }
  end

  def turn_deaths
    players.select { |p| p.death_turn == turn_num }
  end

  def stop!
    ALL.delete channel.id
  end
end