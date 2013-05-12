class ProcessMonitor
  def initialize(process_id)
    @process_id = process_id
  end
  def echo
    @process_id
  end
end
