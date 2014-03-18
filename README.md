AlternatingExecPOC
==================

POC alternating execution populating a "global" array with data.  That data is then pushed into a template at the end.  The "global" array used is the node itself.

Set runlist on a test node as follows:

```
"run_list": [
  "recipe[ordertest::test1]",
  "recipe[ordertest::test2]",
  "recipe[ordertest]"
]
```

assume that it is a linux box for now.  Chef-client run on that node and then confirm template contents in /tmp/outputfile.cfg

contains:

```
  data: test1
  data: test2
```

