keytool -genkey -v -keystore release.jks -alias key -keyalg RSA -keysize 2048 -validity 10000
mv release.jks android/app