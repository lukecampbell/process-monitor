require 'process_monitor'

describe ProcessMonitor, '#rss' do
  it "should call ps_it and strip trailing whitespace" do
    pm = ProcessMonitor.new(5501)
    pm.stub(:ps_it) { " 120\n" }
    pm.rss.should eq "120"
  end
end

describe ProcessMonitor, '#command' do
  it "should return a properly formatted command" do
    pm = ProcessMonitor.new(5501)
    pm.stub(:ps_it) { "/usr/bin/env ruby /some/really/long path name/.with/special_chars inside/application name.app -args --more-args 'with strings'\n" }
    pm.command.should eq "/usr/bin/env ruby /some/really/long path name/.with/special_chars inside/application name.app -args --more-args 'with strings'"
  end
end

describe ProcessMonitor, "#pcpu" do 
  it "should return the percentage" do
    pm = ProcessMonitor.new(5501)
    pm.stub(:ps_it) { "  0.0 \n"}
    pm.pcpu.should eq "0.0"
  end
end

describe ProcessMonitor, "#pmem" do 
  it "should return the percentage" do
    pm = ProcessMonitor.new(5501)
    pm.stub(:ps_it) { "  0.0 \n"}
    pm.pmem.should eq "0.0"
  end
end

describe ProcessMonitor, "#list" do
  it "should list various process monitor insstances" do
    ProcessMonitor.stub(:ps_list) { (0..10).to_a.join("\n") }
    pms = ProcessMonitor.list
    (0..10).each do |i|
      pms[i].process_id.should eq i.to_s
    end
  end
end
