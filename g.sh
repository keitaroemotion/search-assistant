QUERY=$2
NUMERO=1
for var in "$@"
do
    echo "$var:$NUMERO"
    if [ $NUMERO -ne 1 ] && [ $NUMERO -ne 2 ]
    then
       QUERY="$QUERY+$var"
    fi
    $((NUMERO++))
done
echo $QUERY

if [ $TBM != "" ]
then
  TBM="&tbm=$TBM"
fi
ADDR="http://$HOST/$TAIL$QUERY$TBM"
echo $ADDR
open $ADDR
