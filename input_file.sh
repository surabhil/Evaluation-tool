#!/bin/bash
rowf=$(($1-1))
rowl=$(($2+1))
mongo test <<-EOF | head -n -1 | tail -n +3 > original
  db.ow.find({row_id:{\$gt : $rowf, \$lt : $rowl}},{ _id : 0}).toArray()
EOF
cat original
