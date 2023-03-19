flutter build ipa --export-method development --build-name=$1 --build-number=$2
firebase appdistribution:distribute build/ios/ipa/smart_school.ipa --app 1:544862340537:ios:3bcd290d0023763b2a2268
open build/ios/ipa

