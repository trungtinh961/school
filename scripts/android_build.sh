if [ $3 == "bundle" ]
then
flutter build appbundle --build-name=$1 --build-number=$2
firebase appdistribution:distribute build/app/outputs/bundle/release/app-release.aab  --app 1:544862340537:android:c2bb35873359795a2a2268 --groups "tester"
# open build/app/outputs/bundle/release
else
flutter build apk --build-name=$1 --build-number=$2
firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk  --app 1:544862340537:android:c2bb35873359795a2a2268 --groups "tester"
# open build/app/outputs/flutter-apk
fi

