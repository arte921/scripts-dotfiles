while true
do
	aplay $1/`ls $1 | shuf -n1`
	sleep 1
done
