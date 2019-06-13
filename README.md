## Overview

This SDK supports AndroidStudio.

### Changelog

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


### Examples

Please see https://github.com/idnow/de.idnow.android-sample for a sample applications

### Requirements

- minSdkVersion: 18  (Android 4.3)
- targetSdkVersion:	25 (Android 7.0 Nougat)
- Internet connection, communication via standard SSL port 443

### AndroidManifest

The following permissions are required:

```
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.FLASHLIGHT" />
```

If Video-Ident will be used, the following permissions are required as well:

```
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

Additional permissions for certain audio devices:

```
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
```

Moreover, when using an Android LibraryProject, all the Activities, Services and <uses-feature> from the LibraryProject (SDK) have to be mentioned in your Apps AndroidManifest. The simplest way is just to copy the corresponding part of the IDnowSDK AndroidManifest.

## Android Studio

### How to use the .aar file:

Copy the idnow-android-<version>.aar into the apps libs folder.

In your app.gradle add:
```java
repositories {
    flatDir {
        dirs 'libs' //this way we can find the .aar file in libs folder
    }
}
```

and in the dependencies part of your app.gradle add:

```
    compile 'com.example.library:idnow-android-<version>@aar' (replace the 'com.example.library' with your packagename)
```

### Additional dependencies to add in your app.gradle

```
    compile 'de.idnow.sdk:idnow-android-<version>@aar'

    compile 'org.slf4j:slf4j-android:1.7.12'
    compile 'com.squareup.retrofit:retrofit:1.9.0'
    compile 'com.squareup.okhttp3:okhttp:3.12.1'
    compile 'com.googlecode.libphonenumber:libphonenumber:8.4.2'
```

### App Bar

During the use of the SDK the app is NOT showing an App Bar since the ident follows exact predefined steps the user can't influence and because there is nothing to search for.

### SDK size

By default the SDK has a size of roughly 17 mb. This especially includes the necessary native code for WebRTC. If you need to lower the size of your delivered APK for some reason, we advice to use APK splitting (see https://developer.android.com/google/play/publishing/multiple-apks.html)

You can do that by adding the following code to your project:

```
android {
    // Some other configuration here...

    splits {
        abi {
            enable true
            reset()
            include 'x86', 'armeabi', 'armeabi-v7a', 'mips'
            universalApk false
        }
    }
}
```

## Multidex support

Your project might require the usage of multidex if it comes over 65k methods. Please see http://developer.android.com/tools/building/multidex.html for details

## Proguard support

A proguard file is supplied in this project as well.

## Usage

The ONLY class in the SDK designated for user access is the IDnowSDK class.

To create an instance of the IDnow SDK, perform the following call and provide the companyid, which was provided to you during setup as well as an activity that receives callbacks. IDnowSDK is a singleton class, so whenever you need to call it just do so with IDnowSDK.getInstance().

```
IDnowSDK.getInstance().initialize(<Activity>, "<companyid>");
```

Set the static parameters for the SDK usage. Context has to be passed, as parameters are persisted in Preferences. You can decide whether to let the user confirm legal agreements (setShowVideoOverviewCheck).
You also can decide if after the identification the IDnow Error/SuccessScreen is shown, or if the callback to your app is triggered right after identification is finished.

```
IDnowSDK.setShowVideoOverviewCheck(<true/false>, <Context>);
IDnowSDK.setShowErrorSuccessScreen(<true/false>, <Context>);
```

To actually start the identification pass your transaction token.

```
IDnowSDK.getInstance().start(<Your transaction token>);
```

Here is the full example:


```java
try {
	// Initialize with your activity which will handle the SDK callback and pass the id of your company.
	//	IDnowSDK is a singleton class, so just call it with IDnowSDK.getInstance()
	IDnowSDK.getInstance().initialize(StartActivity.this, "ihreBank");

	// Set the transactionToken, for example from a TextField
	IDnowSDK.setTransactionToken(editTextToken.getText().toString(), context);

	// You can decide whether to let the user confirm the legal points.
	IDnowSDK.setShowVideoOverviewCheck(true, context);

	// Same goes to the success screen. If none is shown, the app sends the results right back.
	// The defaults for the both parameters are "true";
	IDnowSDK.setShowErrorSuccessScreen(true, context);

	// Optionally set against which environment the app has to test. Possibilities are DEV, TEST, LIVE, with LIVE being the default.
	IDnowSDK.setEnvironment( Server.TEST );

	// To actually start the identification process, pass the transactionToken.
	IDnowSDK.getInstance().start(IDnowSDK.getTransactionToken(context));
} catch (Exception e) {
	// The SDK checks the input parameters and throws an exception if they don't seem right.
	e.printStackTrace();
}
```

The SDK checks the input parameters and throws an Exception if something is deemed not right, to provide you with quick feedback. Handle it as desired.

To handle the results of the identification, implement the standard onActivityResult function in your activity.:

```
	@Override
	protected void onActivityResult( int requestCode, int resultCode, Intent data )
	{
		if ( requestCode == IDnowSDK.REQUEST_ID_NOW_SDK )
		{
			if ( resultCode == IDnowSDK.RESULT_CODE_SUCCESS )
			{
                If ( data != null )
                {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    Log.v(TAG, "success, transaction token: " + transactionToken);
                }
			}
			else if ( resultCode == IDnowSDK.RESULT_CODE_CANCEL )
			{
                if ( data != null )
                {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    String errorMessage = data.getStringExtra(IDnowSDK.RESULT_DATA_ERROR);
                    Log.v(TAG, "canceled, transaction token: " + transactionToken + “, error: “ + errorMessage);
                }
			}
			else if ( resultCode == IDnowSDK.RESULT_CODE_FAILED )
			{
                if ( data != null )
                {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    String errorMessage = data.getStringExtra(IDnowSDK.RESULT_DATA_ERROR);
                    Log.v(TAG, "failed, transaction token: " + transactionToken + “, error: “ + errorMessage);
                }
			}
			else
			{
				Log.v(TAG, "Result Code: " + resultCode);
			}
		}
	}

```

## Additional settings

You can set the connection type to use: Either use websockets (default) or long polling.

```
IDnowSDK.setConnectionType(IDnowSDK.ConnectionType.LONG_POLLING, context);
```

You can force one of the environments to use. Default is to determine this by the token used.

```
IDnowSDK.setEnvironment(IDnowSDK.Server.TEST);
```

You can disable logging of the SDK by using

```
IDnowSDK.disableLogging();
```

You can set to use your own servers. When this setting is enabled, apiHost, webHost and websocketHost must also be set.

```
IDnowSDK.setEnvironment(IDnowSDK.Server.CUSTOM);
IDnowSDK.setApiHost("https://api.yourserver.com", context);
IDnowSDK.setWebHost("https://www.yourserver.com", context);
IDnowSDK.setWebsocketHost("https://websocket.yourserver.com", context);
IDnowSDK.setVideoHost("https://video.yourserver.com", context);
IDnowSDK.setStunHost("video.yourserver.com", context);
IDnowSDK.setStunPort(3478, context);
```

## Using IDnow with other native libraries (UnsatisfiedLinkError)

For Videostreaming the Idnow SDK uses IceLink which come with native libs.

If your app uses other 3rd party libs that come with their own native libs, it's possible that you get an UnsatisfiedLinkError.

This means that the native lib folders shipped by your 3rd party lib don't match the native lib folders shipped by the Idnow SDK.
Currently the Idnow SDK comes with the following folders: armeabi, armeabi-v7a, arm64-v8a and x86.
If your 3rd party lib only supports some of the architectures but not others (e.g. armeabi, x86 but not armeabi-v7a), you have to exclude the other folders of the Idnow SDK in your build.gradle (in this example: armeabi-v7a) with the following command:

```
android {
//...
packagingOptions {
exclude "lib/armeabi-v7a/"
//...
}
```

If it's the other way round (your 3rd party lib ships more than armeabi, armeabi-v7a, arm64-v8a and x86, you have to exclude these folders, so the remaining folders match the Idnow SDK folders.

For further reading:
http://developer.android.com/ndk/guides/abis.html

## Design configuration


### App icon and logo

A single icon is used as the app launcher icon and logo. You can overwrite it, if you provide assets, named "ic_launcher.png",  in the following sizes in the drawable folders:

- mdpi: 48px * 48px
- hdpi: 72px * 72px
- xhdpi: 96px * 96px
- xxhdpi: 144px * 144px
- xxxhdpi: 192px * 192px

You must not declare it again in your app manifest.

### Colors

The IDnow SDK is designed with colors following the IDnow corperate design. You can use the SDK without making any adaptions to the colors at all. If, however you want the SDK screens to appear in different colors you can make the following adaptions:

#### text_default
Used as default color for display and editable texts
Default: a nearly black color
Recommendation: Should be some kind of a dark color that does not collide with white color.

#### primary
Optional color, that replaces the default brand color.
Default: an orange color
Used in headlines, checkboxes, links, alerts etc.
Recommendation: Should be a color that does not collide with white color.

#### proceed_button_background
Background color for confirmation/continue button, which is usually placed at the bottom of a screen
Default: the primary color (see above)

#### failure
Replaces the text color in the result screen, when an identification failed.
Default: A red color

#### success
Replaces the text color in the result screen, when an identification was successful.
Default: A green color

#### screenshots
Since pictures say more than words, here are some screenshots:
|![overview check screen](docs/screenshot_colors1.png) | ![connecting to video ident](docs/screenshot_colors2.png) | ![succesful ident](docs/screenshot_colors3.png) |

#### overwriting default colors

This is how the colors.xml can look like:
```
<?xml version="1.0" encoding="utf-8"?>
<resources>

    <!-- Used by theme as default color for display and editable texts -->
    <color name="text_default">#4A4A4A</color>

    <!-- Primary color is used for headlines and links -->
    <color name="primary">#F95602</color>

    <!-- background color for confirmation/continue button, which is usually placed at the bottom of a screen -->
    <color name="proceed_button_background">@color/primary</color>

    <!-- "Wiederholen" button when a photo was taken in photo ident -->
    <color name="photo_ident_retake_button_background">@color/text_default</color>

    <!-- Colors of the result screen -->
    <color name="success">#A4AC49</color>
    <color name="failure">#E0727A</color>

</resources>
```

### App theme

This is themes.xml of the SDK:

```
<resources>

    <!-- IdnowSdkTheme is used when no other theme is applied. See documentation if you want to apply a different theme. -->

    <!-- Apply color "text_default" for text elements -->
    <style name="IdnowSdkTheme"
           parent="@android:style/Theme.Holo.Light">
        <!-- applying color "text_default" for common text elements -->
        <item name="android:textColor">@color/text_default</item>
        <item name="android:editTextStyle">@style/IdnowSdkTheme.EditText</item>
    </style>

    <style name="IdnowSdkTheme.EditText"
           parent="android:Widget.EditText">
        <!-- applying color "text_default" for edit text fields as text color -->
        <item name="android:textColor">@color/text_default</item>
    </style>

</resources>
```

As you can see, the theme is based on Holo Light. The only changes made here are applying color "text_default" to standard text elements and edit text fields.

You have three options:

- By not specifying a theme at all, the SDK's theme is used for the whole app.
- Inheriting from the SDK's theme. Here is a usage example (themes.xml):

```
<?xml version="1.0" encoding="utf-8"?>
<resources>

    <style name="MyAppTheme"
           parent="@style/﻿﻿IdnowSdkTheme﻿">
    <!-- Your definitions here -->
    </style>

</resources>
```

- Applying own theme. In this case, it is your own responsibility to apply color "text_default" for standard and edit text elements.


#### Action bar

Here an example on how to set custom action bar colors when using Holo Light theme (themes.xml):
```
<?xml version="1.0" encoding="utf-8"?>
<resources>

    <style name="MyAppTheme"
           parent="@style/﻿﻿IdnowSdkTheme﻿">
        <!-- applying custom actionbar style -->
        <item name="android:actionBarStyle">@style/MyAppTheme.ActionBar</item>
    </style>

    <style name="MyAppTheme.ActionBar"
           parent="@android:style/Widget.Holo.Light.ActionBar">
        <!-- Specify background color of actionbar -->
        <item name="android:background">@color/primary</item>
        <item name="android:titleTextStyle">@style/MyAppTheme.ActionBar.Title</item>
    </style>

    <style name="MyAppTheme.ActionBar.Title"
           parent="@android:style/TextAppearance.Holo.Widget.ActionBar.Title">
        <!-- Specify text color of actionbar -->
        <item name="android:textColor">@color/white</item>
    </style>

</resources>
```
## Texts

The SDK provides English, German, French, Spanish and Italian texts.
