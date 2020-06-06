while true
do
	aplay `ls | shuf -n1`
	sleep 1
done
