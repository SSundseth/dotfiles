require 'rubygems' rescue nil
require 'wirble'
require 'hirb'
require 'ap'

Wirble.init
Wirble.colorize

Hirb::View.enable

IRB.conf[:AUTO_INDENT] = true

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
