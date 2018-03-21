export NEWSTRING=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`
echo $NEWSTRING >> README.md

echo "testing change new string $NEWSTRING"
git add .
git commit -a -m "testing change new string $NEWSTRING"; git push

