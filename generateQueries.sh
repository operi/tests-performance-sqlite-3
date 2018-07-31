#!/bin/bash

#test 1
for i in {1..20000}; do echo "insert into t1 values($i, $(echo $RANDOM), '$(echo $RANDOM)');" >> test1.sh; done

#test 2
for i in {1..50000}; do echo "insert into t2 values($i, $(echo $RANDOM), '$(echo $RANDOM)');" >> test2.sh; done

#test 3
for i in {1..50000}; do echo "insert into t3 values($i, $(echo $RANDOM), '$(echo $RANDOM)');" >> test3.sh; done

#test 4
echo -ne > inicioRange.txt
echo -ne > finRange.txt
seq 0 10 4990 > inicioRange.txt
seq 10 10 5000 > finRange.txt
for i in {1..100}; do echo "select count(*), avg(b) FROM t2 WHERE b>=$(awk "NR == $i" inicioRange.txt) AND b<$(awk "NR == $i" finRange.txt);" >> test4.sh; done

#test 7
echo -ne > inicioRange.txt
echo -ne > finRange.txt
seq 0 10 99990 > inicioRange.txt
seq 10 10 100000 > finRange.txt
for i in {1..5000}; do echo "select count(*), avg(b) FROM t2 WHERE b>=$(awk "NR == $i" inicioRange.txt) AND b<$(awk "NR == $i" finRange.txt);" >> test7.sh; done

#test 8
echo -ne > inicioRange.txt
echo -ne > finRange.txt
seq 0 10 9990 > inicioRange.txt
seq 10 10 10000 > finRange.txt
for i in {1..2000}; do echo "UPDATE t1 SET b=b*2 WHERE a>=$(awk "NR == $i" inicioRange.txt) AND b<$(awk "NR == $i" finRange.txt);" >> test8.sh; done

#test 9
for i in {1..50000}; do echo "UPDATE t2 SET b=$(echo $RANDOM) WHERE a=$i;" >> test9.sh; done

#test 10
for i in {1..50000}; do echo "UPDATE t2 SET c='$(echo $RANDOM)' WHERE a=$i;" >> test10.sh; done

#test 15
for i in {1..24000}; do echo "insert into t1 values($i, $(echo $RANDOM), '$(echo $RANDOM)');" >> test15.sh; done
