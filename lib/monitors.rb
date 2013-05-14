require 'process_monitor'

class Monitor
  attr_reader :loc, :status, :thread
  @@thread_pool = (0..9).map { nil }


  def self.thread_pool
    @@thread_pool
  end

  def initialize(loc)
    @loc = loc
    @status = :ready
    @thread = nil
  end

  def self.new_monitor
    next_available = @@thread_pool.index nil
    if next_available
      obj = self.new next_available
      @@thread_pool[@@thread_pool.index nil] = obj
    end
  end

  def start
    @thread = Thread.new do
      puts "#{@loc} Started"
      while true
        sleep 1
      end
    end
  end

  def stop
    if @thread
      Thread.kill @thread
    end
    if @@thread_pool[@loc]
      @@thread_pool[@loc] = nil
    end
    @status = :dead
  end

end
