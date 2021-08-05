# responsible for the diary entries
class Diary
  attr_reader :entries, :padlock

  def initialize
    @padlock = Lock.new
    @entries = []
  end

  def add_entry(entry)
    raise "This diary is locked." if padlock.locked

    @entries << entry
  end

  def get_entries
    raise "This diary is locked." if padlock.locked

    puts @entries
  end

  def lock
    @padlock.lock
  end

  def unlock
    @padlock.unlock
  end
end
