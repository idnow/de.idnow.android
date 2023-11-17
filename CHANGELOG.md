# Changelog

### 7.4.0

Refactoring and improving the codebase: We have taken various steps to clean up our code, which makes it easier for us to fix bugs and work on new topics
Fixed crashes: We have also identified and fixed some crashes in the flow to offer our end-users a seamless experience
UI/UX enhancements: We have made many adjustments to our user interface (UI) and user experience (UX) to ensure users don't have any trouble going through the flow

### 7.3.0

Seamless video call experience: We have taken additional steps to ensure our end-users have a seamless video call experience
Enhanced security via dTLS: Given our commitment to data privacy and security, we have taken additional measures to make our SDK even more secure to use. A new method (setDtlsCertificateProvider) has been added in the SDK interface in order to support Datagram Transport Layer Security (dTLS).
UI/UX enhancements: We have made many adjustments to our user interface (UI) and user experience (UX) to ensure you have a seamless experience throughout the flow.
Fixed crashes: We have identified and fixed some crashes to offer our end-users a seamless experience

Update eID intermediary certificate: For our eID solution we have updated the intermediary certificate to match the server certificate

### 7.2.0 

- Enhanced security via dTLS: Given our commitment to data privacy and security, we have taken additional measures to make our SDK even more secure to use. A new method (setDtlsCertificateProvider) has been added in the SDK interface in order to support Datagram Transport Layer Security (dTLS).

- Fixed an App crash issue: We had observed a few instances where the last version of our Android SDK was crashing on Android devices below Android 10. This issue has been fixed as part of this release.

- UI/UX enhancements: We have made some small adjustments to our user interface (UI) and user experience (UX) to ensure users have a seamless experience throughout the flow.

### 7.1.0 

Bug fixes:

- Fixing UI behaviour on showing the phone number instead of the placeholder for a specific flow using the setting setFullSizeModalSmsWindow

### 7.0.0 

<strong>Improvements:</strong>

The WebRTC used by our SDK is using the BouncyCastle library as a third-party dependency. As a result, previously, if the same library was being used on the integrator’s part, the two versions would end up in a conflict. In the past, as a temporary solution to this problem, we had to generate a custom version of our SDK, in order to set BouncyCastle as an external dependency.
Starting with our upcoming version (v7.0.0), we will begin offering a more feasible solution to this problem:
We will be using the custom version of our WebRTC that allows us to set BouncyCastle as an external dependency, without having to provide custom SDKs to our clients that are also using this library. This implies that this dependency will have to be added directly in the app.gradle file of the integrator app’s project.

<strong>Migration Guide:</strong>
- Update reference to IDnow SDK 7.0.0
- Update reference eID SDK to 2.7.1
- Add BouncyCastle libs

<strong>IMPORTANT:</strong>
- Please refer to this link to see how to integrate this SDK: [https://github.com/idnow/de.idnow.android#how-to-import-the-sdk](https://github.com/idnow/de.idnow.android#how-to-import-the-sdk)


### 6.8.0 

Improvements:

- Android 14 compatibility: In order to proactively ensure that our SDK is compatible with the upcoming Android release i.e. Android 14, we have made the following changes as per instructions specified by Android:
    - Increase compileSdkVersion and targetSdkVersion to 34 in the build configuration file.
    - The minSdkVersion has also been increased to 23 since Android has mentioned that a targetSdkVersion of lower than 23 will not be supported.
    - Declare new permission to use foreground service types.
    
- Language selector feature: We have introduced a new feature that will allow end-users to choose their preferred language of identification at the beginning of the flow. The choice will be offered depending on the language(s) configured for each customer and the languages supported by the IDnow call center. For this feature, we have added a new library: 
implementation 'com.github.murgupluoglu:flagkit-android:1.0.2

Bug fixes:

- The permissions' popup in dark mode was not easily readable for the users. We have made a slight UI adjustment to make it easier for users to read the content.
- Fix for scroll issue: On some devices we noticed that scrolling was not working as expected on the Terms and Conditions screen. This has been fixed to offer users a seamless experience


### 6.8.0-beta1

Android has announced the release of a new upcoming Android version i.e. Android 14. We have made changes to our Android SDK to make it compatible with the Android 14 beta version that is currently available for testing. Our goal is to proactively take all the necessary steps to ensure that our Android SDK is compatible with the upcoming version, Android 14. However, please note that the only time we can claim with certainty that our SDK is compatible with Android 14, is when it has been officially released. Therefore, for now we are uploading a beta SDK version that is compatible with the Android 14 beta version. Once Android officially releases the new version, we will test it against our SDK to check for compatibility and make any changes, if necessary.
The following changes have been made as part of this release:
- Update compileSdkVersion and targetSdkVersion to 34 in the build configuration file
- Declare new permission to use foreground service types

### 6.7.0

- Configurability for the use of Bluetooth devices: We have now made it possible to configure whether end-users are allowed to perform the VideoIdent and/or eSign process, while being connected to a Bluetooth device. This configurability exists on an OS-level.  
- Better control over WebSocket communication: We have enhanced the way we manage WebSocket communication to reduce connectivity issues once the call gets connected to the identification expert.
- Some crashes have also been identified and fixed to offer end-users a seamless experience

### 6.6.0

- Treating the user's PII data with more care: We have introduced a configurable option to hide the user's PII data so that if a user's Ident ID is somehow accessed by someone else, the user's PII data is not exposed
- Fixed various various leading to NullPointerException: We had come across some instances where a NullPointerException was thrown and we have fixed those as part of this release.
- Network logging issue: We have made sure that the logging functionality works as expected i.e. Data is logged based on whether logging is enabled/disabled


### 6.5.0

Changes have been made to the SDK in order to enhance the security of the communication that takes place between the client and SDK


### 6.4.0

- Removed PhotoIdent: PhotoIdent was an identification method that was offered as part of our SDK. However, this identification method is obsolete now and no longer being used by our customers. Therefore, we have removed it to reduce the overall SDK size. This will make the integration process easier for our customers.
- Enhanced security: We have taken some steps to enhance the level of security in our product. These concern the following activities: IDnowForegroundService & NetworkStatusReceiver

### 6.3.0

Improvement:

The host URL for a third-party service provider required for the eID identification process has been updated upon the service provider's request. Previously, this URL had been statically specified inside our SDK. As part of this release, not only have we updated it to the new one, we have also made it configurable, so that in the future any changes can be taken care of without the need for a release.

### 6.2.0

Improvement:

We have upgraded the libraries responsible for enabling the video call in order to offer end-users and identification experts a seamless experience.

### 6.1.5

Improvements:

For the signing process, we allow additional checkboxes to be configured and displayed to the end-user in case our customers have any regulatory requirement to do so

A library that was not required anymore has been removed to ensure it does not cause any unnecessary risk to the SDK and/or our customers' applications that are using our SDK

AndroidX is a major improvement to the original Android Support Library (the latter is no longer maintained). It fully replaces the Support Library by providing feature parity and new libraries. Therefore, we have migrated to AndroidX so that our customers that are also looking to migrate can do so without any difficulty

Bug fixes:

Some clients reported that they were seeing some NullPointerException crashes on Android. These have now been fixed as part of this release

Our SDK contains Lottie animations, which are required in order for the flow to work as expected. In cases where users had the animations setting disabled in their device, the app was crashing. This has been fixed whereby if animations are disabled in the device, then the screens that contain animations will only display the first frame of the animation as a static image - allowing the user to seamlessly continue with the flow

Migration Guide:

Update reference to IDnow SDK to 6.1.5
Update reference eID SDK to 2.5.5


### 6.1.4

Minor UX improvements:

Automatically opening the keypad upon launching the app
Better positioning of animations in VideoIdent Plus
Reduction of the time it takes animations to finish and allow the user to continue

Bug fixes:
We observed an issue with the eID image capture feature with customers with a certain setup. This has been fixed and it is working as expected now

Migration Guide:

Update reference to IDnow SDK to 6.1.4
Update reference eID SDK to 2.5.4

### 6.1.3

Changes:

- Improved user experience, enhanced security and support for customer requests

Migration Guide:

Update reference to IDnow SDK to 6.1.0 Update reference eID SDK to 2.5.3

### 6.1.2

Changes:

- Implement a mechanism to avoid the clean up of host app files while using the IDnow SDK

Migration Guide:

Update reference to IDnow SDK to 6.1.0 Update reference eID SDK to 2.5.3

### 6.1.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

Update reference to IDnow SDK to 6.1.0 Update reference eID SDK to 2.5.3


### 6.1.0

Changes:

- Minor improvements & bugfixes
- Upgrade to retrofit 2.9.0

Migration Guide:

Update reference to IDnow SDK to 6.1.0 Update reference eID SDK to 2.5.3

### 6.0.0

Changes:

- Upgrade to Liveswitch.

Migration Guide:

Update reference to IDnow SDK to 6.0.0 Update reference eID SDK to 2.5.1

### 5.3.0

Changes:

- Minor improvements & bugfixes
- Support Android 13

Migration Guide:

Update reference to IDnow SDK to 5.3.0
Update reference eID SDK to 2.5.3

### 5.2.0

Changes:

- Minor improvements & bugfixes

Migration Guide:

Update reference to IDnow SDK to 5.2.0
Update reference eID SDK to 2.5.1

### 5.1.12

Changes:

- Show/Hide IDnow Logo via customer config.
- Minor improvements and bug fixes.
Migration Guide:

- Update reference to IDnow SDK to 5.1.12
- Update reference eID SDK to 2.5.0

### 5.1.11

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.1.11
- Update reference to eID SDK to 2.4.0
### 5.1.10

Changes:

- Lottie upgrade to 5.1.1
- eID standalone via customer config 

Migration Guide:

- Update reference to IDnow SDK to 5.1.8

### 5.1.8

Changes:

- Updating customised waiting screen
- Updating dependencies
- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.1.8

### 5.1.7

Changes:

- Support specific camera resolution
- Add more info for the client
- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.1.7

### 5.1.5

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.1.5

### 5.1.3

Changes:

- Minor improvements & bugfixes

- Add a new feature "wallet expired"

Migration Guide:

- Update reference to IDnow SDK to 5.1.3

### 5.1.2

Changes:

- Minor improvements & bugfixes

- Maintenance - API level 31

Migration Guide:

- Update reference to IDnow SDK to 5.1.2

### 5.1.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.1.1

### 5.1.0

Changes:

- Minor improvements & bugfixes
- eID QES feature

Migration Guide:

- Update reference to IDnow SDK to 5.1.0

### 5.0.12.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.12.1

### 5.0.12

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.12

### 5.0.11.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.11.1


### 5.0.11

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.11

### 5.0.9

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.9

### 5.0.8

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.8

### 5.0.7.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.7.1

### 5.0.7

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.7

### 5.0.6

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.6

### 5.0.5.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.5.1

### 5.0.5

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.5

### 5.0.3

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.3

### 5.0.2

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.2

### 5.0.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.1

### 5.0.0

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 5.0.0

### 4.5.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.5.1

### 4.5.0

Changes:

- Dark mode support
- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.5.0

### 4.4.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.4.1

### 4.4.0

Changes:

- Minor improvements & bugfixes
- IDnow rebranding

Migration Guide:

- Update reference to IDnow SDK to 4.4.0

### 4.3.4

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.3.4

### 4.3.3

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.3.3

### 4.3.2

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.3.2

### 4.3.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.3.1

### 4.3.0

Changes:

- Video Ident Plus new feature

Migration Guide:

- Update reference to IDnow SDK to 4.3.0

### 4.2.3

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.2.3

### 4.2.2

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.2.2

### 4.2.1

Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.2.1
- Update reference to eID IDnow SDK 1.0.2 "de.idnow.android.eid:idnow-android-eid-sdk:1.0.2"
### 4.2.0

Changes:

- EID new feature.

Migration Guide:

- Update reference to IDnow SDK 4.2.0
- Add IDnow eID SDK 1.0.0 "de.idnow.android.eid:idnow-android-eid-sdk:1.0.0"

### 4.1.6
Changes:

- Minor improvements & bugfixes
- Update library libphonenumber to 8.10.9

Migration Guide:

- Update reference to IDnow SDK to 4.1.6

### 4.1.5
Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.1.5

### 4.1.4
Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.1.4

### 4.1.3
Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.1.3

### 4.1.2
Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.1.2

### 4.1.1
Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.1.1

### 4.1.0
Changes:

- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.1.0

### 4.0.0
Changes:

- Migrate to Icelink 3
- Minor improvements & bugfixes

Migration Guide:

- Update reference to IDnow SDK to 4.0.0

### 3.22.1
Changes:

- Update the way how to import SDK

Migration Guide:

- Update reference to IDnow SDK to 3.22.1 (dependency: de.idnow.sdk:idnow-android-sdk:3.22.1 )

### 3.22.0
Changes:

- Added waiting screens.
- Minor improvements & bugfixes

Migration Guide:
- New dependency added: androidx.constraintlayout:constraintlayout:1.1.3
- New dependency added: me.relex:circleindicator:1.3.2
- Update reference to IDnow SDK to 3.22.0

### 3.21.1
Changes:

- Minor improvements & bugfixes

Migration Guide:
- Update reference to IDnow SDK to 3.21.1

### 3.21.0
Changes:

- Minor improvements & bugfixes

Migration Guide:
- Update reference to IDnow SDK to 3.21.0

### 3.20.0
Changes:
- Added possibility to use Sentry logging
- Minor improvements & bugfixes

Migration Guide:
- New dependency added: io.sentry:sentry-android:1.7.16
- Update reference to IDnow SDK to 3.20.0

### 3.19.1
Changes:
- Fix for 64-bit support

Migration Guide:
- Update reference to IDnow SDK to 3.19.1

### 3.19.0
Changes:
- Enabled 64-bit support
- Disabled support for x86 architecture
- Minor bugfixes & improvements

Migration Guide:
- Update reference to IDnow SDK to 3.19.0

### 3.18.0
Changes:
- Wallet
- New languages
- Minor bugfixes & improvements

Migration Guide:
- Update reference to IDnow SDK to 3.18.0

### 3.17.1
Migration Guide:
- Update reference to IDnow SDK to 3.17.1

Bugfixes:
- Minor bugfixes

### 3.17.0
Migration Guide:
- Update reference to IDnow SDK to 3.17.0
- Change minSdkVersion to 21
- Update okhttp3 dependency to 3.12.1

Bugfixes:
- Minor bugfixes & improvements

### 3.16.2
Migration Guide:
- Update reference to IDnow SDK to 3.16.2

Bugfixes:
- Fixed callback parameter
- Minor bugfixes

### 3.16.1
Migration Guide:
- Update reference to IDnow SDK to 3.16.1

Bugfixes:
- Fixed callbacks to hostapp

### 3.16.0
Migration Guide:
- Update reference to IDnow SDK to 3.16.0

Bugfixes:
- minor bugfixes

### 3.15.0
Migration Guide:
- Update reference to IDnow SDK to 3.15.0

Improvements:
- removed SMS permission
- minor improvements

Bugfixes:
- minor bugfixes

### 3.14.0
Migration Guide:
- Update reference to IDnow SDK to 3.14.0

Improvements:
- minor improvements

### 3.13.0
Migration Guide:
- Update reference to IDnow SDK to 3.13.0

Improvements:
- minor improvements

Bugfixes:
- minor bugfixes

### 3.12.0
Migration Guide:
- Update reference to IDnow SDK to 3.12.0

Improvements:
- minor improvements

Bugfixes:
- minor bugfixes

### 3.11.0
Migration Guide:
- Update reference to IDnow SDK to 3.11.0

Improvements:
- document validation
- reduced image sizes

Bugfixes:
- minor bugfixes

### 3.10.1
Migration Guide:
- Update reference to IDnow SDK to 3.10.1

Bugfixes:
- minor bugfixes


### 3.10.0
Migration Guide:
- Update reference to IDnow SDK to 3.10.0
- Please see updated dependencies

Bugfixes:
- minor bugfixes


### 3.9.2
Migration Guide:
- Update reference to IDnow SDK to 3.9.2

Bugfixes:
- minor bugfixes


### 3.9.0
Improvements:
- Now supporting Russian and Chinese

Migration Guide:
- Update reference to IDnow SDK to 3.9.0

Bugfixes:
- minor bugfixes


### 3.4.4
Improvements
- textual changes
- dynamic gtu and privacy policy links

Bugfixes
- fixes a problem with the navigation after the user has finished an ident
- other small bugfixes

Migration Guide
- Update reference to IDnow SDK to 3.4.4


### 3.4.0
Improvements
- Sends foreground/background state to the backend
- provides a positioning rectangle during id card front and backside steps
- improves the user interface during the call

Bugfixes
- adds missing translations
- minor bugfixes

Migration Guide
- Update reference to IDnow SDK to 3.4.0

### 3.3.0
Improvements
- Support for qualified signatures in switzerland
- Improved support for the waiting queue
- Added possibility to control the focus from the agent side

Bugfixes
- Made some fixed to the proguard definition
- minor bugfixes

Migration Guide
- Update reference to IDnow SDK to 3.3.0
- Update the proguard definition if necessary

### 3.2.1
Improvements
- removed not needed file write permission
- updated OkHttp to 3.8.1 

Bugfixes
- minor bugfixes

Migration Guide
- Update reference to IDnow SDK to 3.2.1 and to OkHttp 3.8.1

### 3.2.0
Improvements
- Added support for Android 4.3 (VideoIdent only) / Android 4.4
- Improved network stability

Bugfixes
- fixed lock of audio resources (microphone/speakers)

Migration Guide
- Update reference to IDnow SDK to 3.2.0 in your dependencies

### 3.1.3
Improvements
- Support for larger DTLS serverside keys

Bugfixes
- Fixed not correct handling of closing longpolling websocket connections

### 3.1.2
Improvements
- Added support for portugese

Bugfixes
- Correctly handle case of server certificate mismatch in case that certificate pinning is used

Migration Guide:
- Update reference to IDnow SDK to 3.1.2 in your dependencies

### 3.1.1
Improvements
- Added support for waiting list

Bugfixes
- Fixed wrong translations on success screen

Migration Guide:
- Update reference to IDnow SDK to 3.1.1 in your dependencies

### 3.0.0
Improvementes:
- custom client certificate
- server certificate pinning
- reduced overall size of the SDK (OpenTok is not included anymore)
- Removed Eclipse support

Migration Guide:
- Update reference to IDnow SDK to 3.0.0 in your dependencies
- Remove build dependency of OpenTok (compile 'com.opentok.android:opentok-android-sdk:2.9.+')
- Remove "http://tokbox.bintray.com/maven" from maven repositories

### 2.11.2
Bugfixes:
- Fixed audio problems on certain ARM64 Samsung devices
- Fixed problem where audio settings would persist after closing the app
- Fixed audio problem where volume was not correctly adjusted sometimes if headsets are plugged in

Migration Guide:
- Audio is now played in MODE_IN_COMMUNICATION instead of MODE_NORMAL
- Update reference to IDnow SDK to 2.11.2 in your dependencies

### 2.11.0
Improvements:
- Added interface to use custom DTLS certificates for the WebRTC connection
- Improved reconnect behavior in case the server is unavailable for any reason

Migration Guide:
- Update reference to IDnow SDK to 2.11.0 in your dependencies

### 2.10.0

Improvements:
- Added ability to send ident code also by email (configurable, not active by default)

Migration Guide:
- Update reference to IDnow SDK to 2.10.0 in your dependencies

### 2.9.0

Improvements:
- Show the current position in the queue and the estimated waiting time

Migration Guide:
- Update reference to IDnow SDK to 2.9.0 in your dependencies

### 2.8.2

Improvements:
- Improved images sizes for high-resoltion cameras
- Added dedicated support for arm64-v8a to reflect new library loading from Android 6

Bugfixes
- Fixed a crash under Android 7 and Arm64

Migration Guide:
- Update reference to IDnow SDK to 2.8.2 in your dependencies
- Removed x86_64 architecture
- Added arm64-v8a

### 2.8.0

Improvements:
- Added support for text chat between user and agent
- Improved behaviour of the reconnect screen if connection is lost
- Upgraded Tokbox to version 2.9.x
- Use Tokbox directly from maven repository, it has now been removed as static aar

Bugs:
- Fixed race condition which could result in broken image uploads

Migration Guide:
- Add the following entry to the repositories in your build.gradle:
```
maven { url  "http://tokbox.bintray.com/maven" }
```
- Add the following entry to your dependencies:
```
compile 'com.opentok.android:opentok-android-sdk:2.9.+'
```
- Update reference to IDnow SDK to 2.8.0 in your dependencies

### 2.7.0

Improvements
- Switched to OkHttp for websockets which increased speed and stability
- Updated proguard rules for OkHttp
- Gson updated to 2.4

### 2.6.1

Bugfixes
- Fixed a rare crash when initializing the camera using the IDnow videoserver

### 2.6.0

Bugfixes
- Correctly applied custom colors also for certain popups
- Improved connection handling of the initial websocket
- Fixed crash related to VP8 encoding
- Fixed performance problems when performing severals idents in a row
- Better echo cancellation

### 2.5.0

Improvements
- Added support for spatial and temporal resampling of the video stream
- Better handling slow STUN requests
- Prevent parallel uploading of images for faster uploads
- Return success if user aborts on the goodbye screen instead of failure
- Sample mobile number is now "e.g. 0176123..."

Bugfixes
- Fixed crash on some devices when switch from back to front camera
- Fixed bug where audio was not reconnected if user temporarily lost connection

### 2.4.0

Improvements:
- Added jailbreak / rooting detection
- Better wording for Ident-ID

Bugs:
- Fixed focus problem with Samsung devices
- Fixed problems with new google keyboard

### 2.3.2

Improvements:
- Better candidate gathering over slow connections

#### 2.3.1

Improvements
- Handling additional cases of packet loss during video chat

Bugfixes
- Fixed problem uploading images on Android 5.x and Samsung S5 devices

#### 2.3.0

Improvements
- Better handling of connection loss during the video chat
- Logging now enabled by default. Call IDnowSDK.disableLogging() to disable logging
- Removed Jackson dependency

Bugfixes
- Removed app_name string from SDK

#### 2.2.0

Improvements
- Dont allow screenshots during identification due to security considerations
- Success and failure redirects now support custom fields
- Better handling of volume controls of headset plugged in
- During check data, half of the screen is not covered anymore
- Support for swiss environment
- Possibility to change the example mobile number
- Additional customization options: color of proceed_button_text, branded dialogs, color of video_subscriber_border_color and more

Bugfixes
- Fixed wrong SSL certificate validation

#### 2.1.0

Improvements
- Added echo cancellation
