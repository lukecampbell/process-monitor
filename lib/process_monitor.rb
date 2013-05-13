class ProcessMonitor
  attr_accessor :process_id
  
  def initialize(process_id)
    @process_id = process_id
  end
  
  def rss
    ps_it("rss=").strip!
  end
  
  def ps_it(format)
    `ps -ww -p #{@process_id} -o #{format}`
  end
  
  def command
    ps_it("command=").strip!
  end
  
  def pcpu
    ps_it("pcpu=").strip!
  end
  
  def pmem
    ps_it("pmem=").strip!
  end
  
  def pid
    @process_id
  end
  
  def self.list
    self.ps_list.strip.split.each.map do |pid|
      self.new(pid)
    end
  end
  
  def self.ps_list
    `ps -e -o pid=`
  end

end
