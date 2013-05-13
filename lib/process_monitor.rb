class ProcessMonitor
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
end
