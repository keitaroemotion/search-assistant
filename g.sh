TAIL=""
TBM=""
case $HOST in
 "-l")
   LINK="http://$2"
   #LINK=$(echo $LINK  | tr -d '+')
   open $LINK
   exit 0
   ;;
 "-y")
  HOST="youtube.com"
  TAIL="results?search_query="
  ;;
 "-v")
  HOST="google.com"
  TAIL="search?q="
  TBM="vid"
  ;;
 "-i")
  HOST="google.com"
  TAIL="search?q="
  TBM="isch"
  ;;
 *)
  HOST="google.com"
  TAIL="search?q="
  ;;
esac

echo "HOST:$HOST"

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
