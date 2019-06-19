class Player
  attr_reader :item, :death_turn

  def initialize(user)
    @name = user.username
  end

  def name
    "**#{@name}**"
  end
  alias to_s name

  def item?
    @item.present?
  end

  def alive?
    @death_turn.nil?
  end

  def dead?
    not alive?
  end

  def kill!(turn)
    raise "Tried to murder dead player #{name}" if dead?
    @death_turn = turn
  end

  def give!(item)
    @item = item
  end
end