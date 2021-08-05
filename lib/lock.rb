# responsible for locking
class Lock
  attr_reader :locked

  def initialize 
    @locked = true
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end
