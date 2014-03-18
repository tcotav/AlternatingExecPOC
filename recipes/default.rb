#
# Cookbook Name:: ordertest
# Recipe:: default
#
# Copyright 2014, James Francis
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# what we want to do here is to run the final command -- write out the template
ofilekey="outputfile"
if node.has_key? ofilekey
  Chef::Log.error("base has key")  # this one should win and does in tests

  l=node[ofilekey]
else
  l= Array.new
end

template "/tmp/outputfile.cfg" do
  source "output.cfg.erb"
  variables({
    :outputlist => l
  })
  action :nothing
end

ruby_block 'placeholder' do
  block do
    puts 'ruby block'
  end
  notifies :create, "template[/tmp/outputfile.cfg]", :delayed
end


