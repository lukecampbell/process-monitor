require 'monitors'

describe Monitor , '#new' do
  it "should set loc and nil the thread" do
    monitor = Monitor.new 0
    monitor.loc.should eq 0
    monitor.thread.should eq nil
  end
end

describe Monitor, '#stop' do
  it "should kill the thread and remove it from the thread pool" do
    monitor = Monitor.new 0
    monitor.status.should eq :ready
    monitor.stop
    monitor.status.should eq :dead
    monitor.thread.should eq nil
  end
end

describe Monitor, '#start' do
  it "should start a thread" do
    monitor = Monitor.new 0
    monitor.start
    monitor.thread.should be_a_kind_of(Thread)
    Thread.kill(monitor.thread)
  end
end

describe Monitor do
  it "there should only be ten allowed" do
    monitors = (0..10).map { Monitor.new_monitor }
    monitors[10].should be nil
    (0..9).each do |i|
      monitors[i].should be Monitor.thread_pool[i]
    end
  end
end

 
