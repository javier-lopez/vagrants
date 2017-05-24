# Usage:    IE={box} vagrant up
#
# Eg.       IE=XPIE6 vagrant up

boxes = {
    "XPIE6"     => "http://aka.ms/vagrant-xp-ie6",
    "XPIE8"     => "http://aka.ms/vagrant-xp-ie8",
    "VistaIE7"  => "http://aka.ms/vagrant-vista-ie7",
    "Win7IE8"   => "http://aka.ms/vagrant-win7-ie8",
    "Win7IE9"   => "http://aka.ms/vagrant-win7-ie9",
    "Win7IE10"  => "http://aka.ms/vagrant-win7-ie10",
    "Win7IE11"  => "http://aka.ms/vagrant-win7-ie11",
    "Win8IE10"  => "http://aka.ms/vagrant-win8-ie10",
    "Win8IE11"  => "http://aka.ms/vagrant-win81-ie11",
}

unless boxes.has_key? ENV['IE']
    abort('Invalid box supplied')
end

Vagrant.configure("2") do |config|
	config.vm.box = ENV['IE']
	config.vm.box_url = boxes[ ENV['IE'] ]
	config.vm.guest = :windows
	config.vm.boot_timeout = 1
	config.vm.communicator = "winrm"
	config.vm.provider "virtualbox" do |vm|
  		vm.gui = true
	end
end
