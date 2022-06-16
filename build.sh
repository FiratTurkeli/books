if [ "$1" = "force" ]
then
    flutter packages pub run build_runner build  --delete-conflictin-outputs
else
    flutter packages pub run build_runner build
