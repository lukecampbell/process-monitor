require 'process_monitor'

describe ProcessMonitor, "#echo" do
  it "returns pid" do
    pm = ProcessMonitor.new(5501)
    pm.echo.should eq 5501
  end
end

