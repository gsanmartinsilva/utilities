free -m | awk '/^Mem/ {print 1+int(100*$3 '/' $2)"%"}'
