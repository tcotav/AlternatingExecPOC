s='test1'
  if node.has_key? 'outputfile'
    Chef::Log.error("test1 has key")
    node.default['outputfile'].push(s)
  else
    Chef::Log.error("test1 NO key")
    llist=Array.new
    llist.push(s)
    node.default['outputfile']=llist
  end