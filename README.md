 # Table of Contents
   
- [Overview](#overview)
  - [Examples](#examples)
  - [Requirements](#requirements)
  -  [Supported versions](#supported-versions)
  - [AndroidManifest](#androidmanifest)
- [Android Studio](#android-studio)
  - [How to import the SDK](#how-to-import-the-sdk)
  - [How to use the .aar file](#how-to-use-the-aar-file)
  - [App Bar](#app-bar)
  - [SDK size](#sdk-size)
- [Multidex support](#multidex-support)
- [Proguard support](#proguard-support)
- [Usage](#usage)
- [Additional settings](#additional-settings)
- [Using IDnow with other native libraries (UnsatisfiedLinkError)](#using-idnow-with-other-native-libraries-unsatisfiedlinkerror)
- [Design configuration](#design-configuration)
  - [Languages](#languages)
  - [App icon and logo](#app-icon-and-logo)
    - [Colors](#colors)
    - [text_default](#text_default)
    - [primary](#primary)
    - [proceed_button_background](#proceed_button_background)
    - [failure](#failure)
    - [success](#success)
    - [screenshots](#screenshots)
    - [overwriting default colors](#overwriting-default-colors)
  - [App theme](#app-theme)
    - [Action bar](#action-bar)
- [Texts](#texts)
- [IDnow eID SDK](#idnow-eid-sdk)
  - [eID Requirements](#eid-requirements)
  - [eID Installation](#eid-installation)
     - [Host App settings](#hostappsettings)
        - [How to import eID SDK](#how-to-import-eid-sdk)
        - [Import the SDK as .aar file](#import-the-sdk-as-.aar-file)
  - [eID Colors](#eid-colors)
     - [Title Color](#title-color)
     - [Text Color](#text-color)
     - [Layout button color (Switch to video ident)](#layout-button-color-(Switchtovideoident))
     - [Text Redirection Color](#text-redirection-color)
     - [Button Color](#button-color)

## Overview

This SDK supports AndroidStudio.

### Examples

Please see https://github.com/idnow/de.idnow.android-sample for a sample applications

### Requirements

- minSdkVersion: 21  (Android 5.0)
- targetSdkVersion:	28 (Android 9.0 Pie)
- Internet connection, communication via standard SSL port 443

### Supported versions

- Your current SDK will stop receiving further support by May 21 (VideoIdent SDKs of version 4.2.0 and lower; 4.2.1 and higher continue to be supported)
- After this time, the old SDK will continue to be operational, but we won’t provide any more updates and maintenance only with additional reimbursement

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

### How to import the SDK

[![Watch the video](https://github.com/idnow/de.idnow.android/blob/master/docs/screenshot_video1.png)](https://youtu.be/yKOu-luc1x8)

In your top-level build.gradle project file add the following url under repositories block :

```
allprojects {
repositories {
..
maven {
url "https://raw.githubusercontent.com/idnow/de.idnow.android/master"
}
..
}
}
```

and in the dependencies part of your app.gradle add :   

```
dependencies {
..
implementation 'de.idnow.sdk:idnow-android-sdk:4.x.x'
..
}
```

### How to use the .aar file:

[![Watch the video](https://github.com/idnow/de.idnow.android/blob/master/docs/Screenshot_video2.png)](https://youtu.be/yMIpthcLRnw)

Copy the idnow-android-.aar into the apps libs folder.

In your app.gradle add:

```
repositories {
flatDir {
dirs 'libs' //this way we can find the .aar file in libs folder
}
}
```

Additional dependencies to add in your app.gradle :

``` 
dependencies {
    implementation 'de.idnow.sdk:idnow-android-x.x.x@aar'
    implementation 'com.squareup.retrofit:retrofit:1.9.0'
    implementation 'com.squareup.okhttp3:okhttp:3.12.1'
    implementation 'com.android.support:support-v4:28.0.0'
    implementation 'com.android.support:appcompat-v7:28.0.0'
    implementation 'com.android.support:support-annotations:26.1.0'
    implementation 'com.googlecode.libphonenumber:libphonenumber:8.10.9'
    implementation "androidx.constraintlayout:constraintlayout:1.1.3"
    implementation 'me.relex:circleindicator:1.3.2'
    implementation 'com.android.support:recyclerview-v7:28.0.0'
    
    }
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

You can set the connection type to use: websockets.

```
IDnowSDK.setConnectionType(IDnowSDK.ConnectionType.WEBSOCKET, context);
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
You can set the new branding 

```
IDnowSDK.setNewBrand(TRUE);
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

### Languages

In case you would like to change the language used by the IDnow SDK at runtime you can do the following in the host App during the initialization : 

```
IDnowSDK.getInstance().initialize( StartActivity.this, "", language);
```
Language values are : en (English), de (German), fr (French), es (Spanish), it (Italian), pt (Portugese), et (Estonian), hr (Croatian), hu (Hungarian), ka (Georgian), ko(Korean), lt(Lithuanian), lv (Latvian), nl (Dutch), pl (Polish),  ru (Russian), zh (Chinese).


### App icon and logo

A single icon is used as the app launcher icon and logo. You can overwrite it, if you provide assets, named "ic_launcher.png",  in the following sizes in the drawable folders:

- mdpi: 48px * 48px
- hdpi: 72px * 72px
- xhdpi: 96px * 96px
- xxhdpi: 144px * 144px
- xxxhdpi: 192px * 192px

You must not declare it again in your app manifest.

### Colors

The IDnow SDK is designed with colors following the IDnow corperate design. You can use the SDK without making any adaptions to the colors at all. If, however you want the SDK screens to appear in different colors.

Our SDK supports Light Mode as well as the Dark Mode version. Currently, if dark mode is enabled on the user's mobile device, the SDK will automatically appear in Dark Mode.

you can make the following adaptions for Light Mode and Dark Mode :

Video Ident Plus enabled :

#### primaryColor
Used as default color of the App and the component such as the buttons

#### primaryVariantColor
Useed as a desactivated color for the buttons, it should use same value as primaryColor with a transparent code.

#### primarytextColor
Useed as a text color for the whole App

#### bgPrimaryColor
Used as background color for the screens.

#### bgSecondaryColor
Used as background color for the textfields

#### basicInputField
Used as text color color for the textfields

#### overwriting default colors

Video Ident Plus disbled :

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
|![overview check screen](docs/screenshot_colors1.png) | ![connecting to video ident](docs/screenshot_colors2.png) | ![succesful ident](docs/screenshot_colors3.png)

This is how the colors.xml can look like:
```
<?xml version="1.0" encoding="utf-8"?>
<resources>


    <color name="primaryColor">#DE6240</color>
    <color name="primaryVariantColor">#80DE6240</color>
    <color name="bgPrimaryColor">#32343F</color>
    <color name="bgSecondaryColor">#39414A</color>
    <color name="primarytextColor">#FFFFFF</color>
    <color name="basicInputField">#AAA7A8</color>

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

#### Fonts
Here an example on how to set custom font (themes.xml):

```
    <style name="MyAppTheme"
        parent="IdnowSdkTheme">
        <!-- Your definitions here -->
        <item name="android:fontFamily">@font/wotfard_regular</item>
    </style>
```

## Texts

The SDK provides English, German, French, Spanish, Italian, Hungarian, Georgian, Korean, Dutch, Polish, Portuguese, Russian and Chinese    texts.

## IDnow eID SDK

IDnow eID feature is a seperate module in Video ident Product.

## eID Requirements

- `public.electronicID ` set to true in customer config
- Device supporting NFC feature

## eID Installation

### Host App settings

#### How to import eID SDK

in `build.gradle` file add the following instructions :

```
android {
defaultConfig {
….
multiDexEnabled true
…
}
compileOptions {
    sourceCompatibility 1.8
    targetCompatibility 1.8
}
packagingOptions {
    exclude 'META-INF/*.kotlin_module'
}
}

allprojects {
    repositories {
        google()
        jcenter()
        maven {
            url = uri("https://repo.authada.de/public/")
            authentication {
                basic(BasicAuthentication)
            }
            credentials {
                username "*********"
                password "*********"
            }
        }
        maven {
            url "https://raw.githubusercontent.com/idnow/de.idnow.android/master"
        }
    }
} 

Dependencies {
compile 'de.idnow.sdk:idnow-android:x.x.x'
compile 'de.idnow.android.eid:idnow-android-eid-sdk:1.0.2'
}
```

#### Import the SDK as .aar file 

We offer the possibility to import the SDK as an .aar file instead.

Copy the `idnow-android-x.x.x.aar` and `idnow-android-eid-sdk-x.x.x`.aar files into the apps libs folder.

```
android {
defaultConfig {
….
multiDexEnabled true
…
}
compileOptions {
    sourceCompatibility 1.8
    targetCompatibility 1.8
}
packagingOptions {
    exclude 'META-INF/*.kotlin_module'
}
}

allprojects {
    repositories {
        google()
        jcenter()
        maven {
            url = uri("https://repo.authada.de/public/")
            authentication {
                basic(BasicAuthentication)
            }
            credentials {
                username "*********"
                password "*********"
            }
        }
        flatDir {
        dirs 'libs' //this way we can find the .aar file in libs folder
        }
    }
}

Dependencies {
implementation 'de.idnow.sdk:idnow-android-x.x.x@aar'
implementation 'de.idnow.android.sdk:idnow-android-eid:1.0.2@aar'
implementation 'com.squareup.retrofit:retrofit:1.9.0'
implementation 'com.squareup.okhttp3:okhttp:3.12.1'
implementation 'com.android.support:support-v4:28.0.0'
implementation 'com.android.support:support-annotations:26.1.0'
implementation 'com.googlecode.libphonenumber:libphonenumber:8.10.9'
implementation "androidx.constraintlayout:constraintlayout:1.1.3"
implementation 'me.relex:circleindicator:1.3.2'
} 
```
### eID Colors

colors are customisable by overriding the values of a specific key

#### Title Color 

Key : `eid_title`

default color in the sdk : <color name="eid_title">#1E1E1E</color>

#### Text color

Key : `text_default`

default color in the sdk : <color name="text_default">#4A4A4A</color>

#### Layout button color (Switch to video ident)

Key : `error_layout_button`

default color in the sdk : <color name="error_layout_button">#FDEFEB</color>

#### Text redirection color

Key : `error_layout_button`

default color in the sdk : <color name="eid_text_link">#4285F4</color>

#### Button color

Key : `primary`

default color in the sdk : <color name="primary">#F95602</color>
