s='test2'
if node.has_key? 'outputfile'
  Chef::Log.error("test2 has key")
  node.default['outputfile'].push(s)
else
  llist=Array.new
  llist.push(s)
  Chef::Log.error("test2 NO key")
  node.default['outputfile']=llist
end