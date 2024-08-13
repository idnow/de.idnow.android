 # Table of Contents
   
- [Overview](#overview)
  - [Examples](#examples)
  - [Requirements](#requirements)
  - [Supported versions](#supported-versions)
  - [Compatibility, End of Support, End of Life](#compatibility-matrix)
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
  - [Connection type](#connection-type)
  - [Environment](#environment)
  - [Logging](#logging)
  - [Servers](#servers)
  - [Branding](#branding)
  - [Certificate provider](#certificate-provider)
- [Bouncy castle](#bouncy-castle)
  - [Supported BouncyCastle versions](#Supported-BouncyCastle-versions)
- [Animations](#animations)
- [Foreground Services](#foreground-services)
  - [Declaring your foreground service information in Play Console](#declaring-your-foreground-service-information-in-play-console)
- [Supported Architecture](#Supported-Architecture)
  - [arm64-v8a](#arm64-v8a)
  - [armeabi-v7a](#armeabi-v7a)
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
  - [Fonts](#fonts)
    - [Action bar](#action-bar)
- [Texts](#texts)
- [IDnow eID SDK](#idnow-eid-sdk)
  - [eID Requirements](#eid-requirements)
  - [eID Installation](#eid-installation)
     - [Host App settings](#hostappsettings)
        - [How to import eID SDK](#how-to-import-eid-sdk)
        - [Import the SDK as .aar file](#import-the-sdk-as-.aar-file)
  - [eID usage](#eid-usage)
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

- minSdkVersion: 23  (Android 6.0)
- targetSdkVersion:	34 (Android 14.0 beta Upside-Down Cake)
- Internet connection, communication via standard SSL port 443

### Supported versions

- Your current SDK will stop receiving further support by May 21 2020 (VideoIdent SDKs of version 4.2.0 and lower; 4.2.1 and higher continue to be supported)
- After this time, the old SDK will continue to be operational, but we won’t provide any more updates and maintenance only with additional reimbursement

### Compatibility Matrix

Please refer to the following link to find information about compatibility, end-of-support (EOS) and end-of-life (EOL) dates pertaining to our products: [IDnow Compatibility Matrix: Browser & OS Compatibility guide](https://www.idnow.io/developers/compatibility-overview/)

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

If EID will be used, the following permission is required as well:

```
<uses-permission android:name="android.permission.NFC" />
```

Additional permissions for certain audio devices:

```
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>

```

Moreover, when using an Android LibraryProject, all the Activities, Services and <uses-feature> from the LibraryProject (SDK) have to be mentioned in your Apps AndroidManifest. The simplest way is just to copy the corresponding part of the IDnowSDK AndroidManifest.

## Android Studio

### How to import the SDK

[![Watch the video](https://github.com/idnow/de.idnow.android/blob/master/docs/screenshot_video1.png)](https://youtu.be/yKOu-luc1x8)

Starting with SDK version 7.0.0 we offer the possibility to integrate your bouncycastle preferred version as an external library.
We offer the bouncycastle version 1.64 as a default (only compile) used version, therefore integrating bouncycastle as external library is mandatory for the runtime. 
If you don't have any Bouncycastle version preferences, you can use the following https://github.com/idnow/de.idnow.android-sample/tree/master/app/libs


In your top-level build.gradle project file add the following url under repositories block:

```
allprojects {
repositories {
..
maven {
url "https://raw.githubusercontent.com/idnow/de.idnow.android/master"
} 
maven { url 'https://jitpack.io' }
..
}
}
```

Copy bouncycastle libraries bcprov-jdk15to18-x.x.jar, bctls-jdk15to18-x.x.jar and bcutil-jdk15to18-x.x.jar into the apps libs folder 



In the dependencies part of your app.gradle you have to add IDnow SDK dependency alongside with bouncycastle libraries to be used 

```
dependencies {
..
// IDnow SDK lib
implementation 'de.idnow.sdk:idnow-android-sdk:x.x.x' 

// Bouncycastle external libs 
implementation files ('libs/bcprov-jdk15to18-x.x.jar')
implementation files ('libs/bctls-jdk15to18-x.x.jar')
implementation files ('libs/bcutil-jdk15to18-x.x.jar') //optional
..
}
```

### How to use the .aar file:

[![Watch the video](https://github.com/idnow/de.idnow.android/blob/master/docs/Screenshot_video2.png)](https://youtu.be/yMIpthcLRnw)

Starting with SDK version 7.0.0 we offer the possibility to integrate bouncycastle as an external library.
We offer the bouncycastle version 1.64 as a default (only compile) used version, therefore integrating bouncycastle as external library is mandatory for the runtime.

Copy the idnow-android-sdk.7.0.0 and bouncycastle libraries into the apps libs folder.
If you don't have Bouncycastle version preferences, you can use the following https://github.com/idnow/de.idnow.android-sample/tree/master/app/libs

In your app.gradle add:

```
repositories {
	
maven {
  url "https://raw.githubusercontent.com/idnow/de.idnow.android/master" 
       }
       
maven { url 'https://jitpack.io' }
       	
flatDir {
dirs 'libs' //this way we can find the .aar file in libs folder
}
}
```

Additional dependencies to add in your app.gradle:

``` 
dependencies {
    // 	IDnow SDK
    implementation 'de.idnow.sdk:idnow-android-x.x.x@aar'
    // Bouncycastle external libs
    implementation files ('libs/bcprov-jdk15to18-x.x.jar')
    implementation files ('libs/bctls-jdk15to18-x.x.jar')
    implementation files ('libs/bcutil-jdk15to18-x.x.jar') // optional 
    
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.okhttp3:okhttp:4.9.3'
    implementation 'com.squareup.okhttp3:logging-interceptor:4.9.3'
    implementation 'androidx.legacy:legacy-support-v4:1.0.0'
    implementation 'androidx.annotation:annotation:1.3.0'
    implementation "androidx.constraintlayout:constraintlayout:2.1.3"
    implementation 'androidx.appcompat:appcompat:1.4.1'
    implementation 'androidx.recyclerview:recyclerview:1.2.1'
    implementation 'com.googlecode.libphonenumber:libphonenumber:8.10.9'
    implementation 'me.relex:circleindicator:2.1.6'
    implementation 'de.idnow.insights:idnow-android-insights-sdk:1.2.0'
    implementation 'com.airbnb.android:lottie:5.1.1'
    implementation 'androidx.preference:preference:1.2.0'
    implementation "androidx.percentlayout:percentlayout:1.0.0"
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
    implementation 'com.github.barteksc:android-pdf-viewer:2.6.0'
    implementation 'com.google.android.material:material:1.5.0'
    implementation 'com.github.murgupluoglu:flagkit-android:1.0.2'
    }
```

### App Bar

During the use of the SDK the app is NOT showing an App Bar since the ident follows exact predefined steps the user can't influence and because there is nothing to search for.

### SDK size

By default the SDK has a size of roughly 15 mb.

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
	IDnowSDK.setTransactionToken(editTextToken.getText().toString());

	// You can decide whether to let the user confirm the legal points.
	IDnowSDK.setShowVideoOverviewCheck(true, context);

	// Same goes to the success screen. If none is shown, the app sends the results right back.
	// The defaults for the both parameters are "true";
	IDnowSDK.setShowErrorSuccessScreen(true, context);

	// Optionally set against which environment the app has to test. Possibilities are DEV, TEST, LIVE, with LIVE being the default.
	IDnowSDK.setEnvironment( Server.TEST );
	
	
	// Set the custom certificate provider
	IDnowSDK.setCertificateProvider(new CustomerCertificateProvider(this.context))

	// To actually start the identification process, pass the transactionToken.
	IDnowSDK.getInstance().start(IDnowSDK.getTransactionToken());
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

### Connection type

You can set the connection type to use: websockets.

```
IDnowSDK.setConnectionType(IDnowSDK.ConnectionType.WEBSOCKET, context);
```

### Environment

You can force one of the environments to use. Default is to determine this by the token used.

```
IDnowSDK.setEnvironment(IDnowSDK.Server.TEST);
```

### Logging

You can disable logging of the SDK by using

```
IDnowSDK.disableLogging();
```

### Servers

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

### branding

You can set the new branding (Circular background for the buttons)

```
IDnowSDK.setNewBrand(TRUE);
	
```

### Certificate Provider

		
 Starting from SDK version 7.2.0 we offer to set your own DTLS certificates used by the WebRTC connection.
	
```
	
IDnowSDK.setDtlsCertificateProvider(customerCertificateProvider)
	
```	
	
 
 
 Starting from SDK version 6.5.0 we offer MTLS support for API connections

 ```
	
IDnowSDK.setCertificateProvider(customerCertificateProvider)
	
```	
 
 MTLS enables server/client certificate validation. 
 SDK can provide custom client certificate and several server certificates
 
 What has changed:

 - Certificate provider now can validate multiple server certificates/fingerprints
 - REST supports MTLS
 - WebSocket supports MTLS. For this purpose, SRWebsocket implementation was slightly updated. So, now we have a local version of SRWebsocket.
 
 Certificate Generation :
Client certificate and private key pair can be generated in a number of ways, for example, with Certificate Sign Request on Mac OS X Keychain.

Client Certificates :


- client certificate (x509/ASN.1) should be imported in DER-format. For example, conversion from PEM:

```
openssl x509 -outform der -in yourcertificate.pem -out yourcertificate.der
```

- private key (RSA) should also be imported in DER-format

 
How to do it:
 
 1 - Create class similar class to MyMtlsCertificateProvider in android folder
 2 - Do IDnowSDK.setCertificateProvider(new MyMtlsCertificateProvider(context));

Feature flags for certificate provider allow usage of the corresponding features:

```
    public boolean featureCertificate() { return true; }  // use client certificate
    public boolean featureFingerPrint() { return true; } // use server certificate fingerprints
    public boolean featureServerCert()  { return true; }  // use server certificates
```    
    

N.B You can checkout the Sample App https://github.com/idnow/de.idnow.android-sample (branch : set_certificate_provider ) to see the implementation
	
	
## Supported Architecture

Different Android devices use different CPUs, which in turn support different instruction sets.

As Our SDK is using a 3rd party lib wchich is limiting us to support the same instruction sets.
	
Today we don't support the architecture x86_64 and x64 and we only support the following architecture :
	
### arm64-v8a
	
This ABI is for ARMv8-A based CPUs, which support the 64-bit AArch64 architecture. It includes the Advanced SIMD (Neon) architecture extensions.
	
### armeabi-v7a
	
This ABI is for 32-bit ARM-based CPUs. The Android variant includes Thumb-2 and the VFP hardware floating point instructions, specifically VFPv3-D16, which includes 16 dedicated 64-bit floating point registers.

## Using IDnow with other native libraries (UnsatisfiedLinkError)

For Videostreaming the Idnow SDK uses IceLink which come with native libs.

If your app uses other 3rd party libs that come with their own native libs, it's possible that you get an UnsatisfiedLinkError.

This means that the native lib folders shipped by your 3rd party lib don't match the native lib folders shipped by the Idnow SDK.
Currently the Idnow SDK comes with the following folders: armeabi-v7a, arm64-v8a.
If your 3rd party lib only supports some of the architectures but not others (e.g. armeabi, but not armeabi-v7a), you have to exclude the other folders of the Idnow SDK in your build.gradle (in this example: armeabi-v7a) with the following command:

```
android {
//...
packagingOptions {
exclude "lib/armeabi-v7a/"
//...
}
```

If it's the other way round (your 3rd party lib ships more than armeabi, armeabi-v7a, arm64-v8a, you have to exclude these folders, so the remaining folders match the Idnow SDK folders.

For further reading:
http://developer.android.com/ndk/guides/abis.html
	
## Bouncy castle
	
The WebRTC used by our SDK is using the Bouncy Castle third-party dependency. This implies that if the same dependency is being used on the integrator’s part, the two versions will conflict. As a solution to this problem, we are using a custom version of our WebRTC that allows us to set BouncyCastle as an external dependency. This implies that the following dependency will also have to be added directly in the app.gradle file of the integrator app’s project, along with other listed dependencies:

```    
   implementation files ('libs/bcprov-jdk15to18-x,x.jar')
   implementation files ('libs/bctls-jdk15to18-x.x.jar')
   implementation files ('libs/bcutil-jdk15to18-x.x.jar')
```

N.B Importing IDnow SDK without bouncy castle libs, you will encounter the error ClassNotFoundException 

### Supported BouncyCastle versions 

- Starting with IDnow SDK version 7.0.0, we are supporting BouncyCastle as an external dependency.
- The default BouncyCastle version used in the SDK is <strong>v1.64</strong> (only compile) a bouncy castle external is still needed.
- The BouncyCastle versions that are supported are v1.63+.
	
## Animations
	
In order for end-users to have a seamless experience, the device needs to have the animation capability enabled, otherwise screens that contain animations will not function as intended.

## Foreground Services

A foreground service performs operations that are visible to the user, and informs them that the app is performing a task in the foreground and consuming system resources. This can happen even when the user is not directly interacting with the app.

We are using foreground services in our SDK to perform a task that is required in the process of connecting the end-user with the identification expert, as it is a prerequisite for the video call.

The aim of this task is to keep the camera and microphone in active mode while the end-user is waiting to get connected to our identification expert. This is important to prevent an empty black screen from showing at the time when the identification expert picks up the call as the user may have put the app in the background while waiting.

<b>Camera</b>:

Continue to access the camera from the background, such as video chat apps that allow for multitasking.

<b>Microphone</b>:

Continue microphone capture from the background, such as voice recorders or communication apps.

To achieve this, we are required to declare permissions to use foreground services. Starting with Android 14, we are obliged to update our service declaration in the AndroidManifest file and specify the correct foreground service type that we are using.

```
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_CAMERA"/>

<uses-permission android:name="android.permission.FOREGROUND_SERVICE_MICROPHONE"/>

<manifest xmlns:android="http://schemas.android.com/apk/res/android" ...>

    <service

        android:name=".MyForegroundService"

        android:foregroundServiceType="camera|microphone"

        android:exported="false">

    </service>

</manifest>
```

### Declaring your foreground service information in Play Console

You’ll need to declare any foreground service types that you use in a new declaration (camera and microphone) on the App content page (Policy > App content) in Play Console .

You’ll need to mention the following undeclared foreground service permissions

```
FOREGROUND_SERVICE_CAMERA
FOREGROUND_SERVICE_MICROPHONE
```

Additionally, a video is often required to demonstrate how the app uses the foreground service.

Please contact the support team in case that video is needed. 

### Languages

In case you would like to change the language used by the IDnow SDK at runtime you can do the following in the host App during the initialization: 

```
IDnowSDK.getInstance().initialize( StartActivity.this, "", language);
```
Language values are: en (English), de (German), fr (French), es (Spanish), it (Italian), pt (Portuguese), et (Estonian), hr (Croatian), hu (Hungarian), ka (Georgian), ko(Korean), lt(Lithuanian), lv (Latvian), nl (Dutch), pl (Polish),  ru (Russian), zh (Chinese), uk (Ukrainian)


### App icon and logo

A single icon is used as the app launcher icon and logo. You can overwrite it, if you provide assets, named "ic_launcher.png",  in the following sizes in the drawable folders:

- mdpi: 48px * 48px
- hdpi: 72px * 72px
- xhdpi: 96px * 96px
- xxhdpi: 144px * 144px
- xxxhdpi: 192px * 192px

You must not declare it again in your app manifest.

### Colors

The IDnow SDK is designed with colors following IDnow's corporate design. You can use the SDK without making any adaptions to these colors. However, if you want the SDK screens to appear in different colors, that can be achieved using the generic branding color keys below:


#### primaryColor
Used as default color of the App and the component such as the buttons

#### primaryVariantColor
Used as a deactivated color for the buttons, it should use same value as primaryColor with a transparent code.

#### primarytextColor
Used as a text color for the whole App

#### bgPrimaryColor
Used as background color for the screens.

#### bgSecondaryColor
Used as background color for the text fields

#### basicInputField
Used as text color for the text fields

Even though we strongly recommend our customers to stick to the generic branding color keys listed above, it is worth mentioning that for some screens we also offer keys for screen-specific customizations. If you would like to make any such customization, please reach out to us with the details so we can let you know if that is possible.

Note: Due to the high number of keys available in the SDK, it is not feasible to mention all of those here.

### App theme

This is themes.xml of the SDK:

```
<resources>

    <!-- IdnowSdkTheme is used when no other theme is applied. You are free to adapt the SDK theme in the App or use your own theme.

    <style name="IdnowSdkTheme" parent="IdnowSdkThemeWithoutBackround">
        <item name="android:background">@color/bgPrimaryColor</item>
        <item name ="android:colorBackground">@color/bgPrimaryColor</item>
    </style>
    
        <style name="IdnowSdkThemeWithoutBackround"
        parent="Theme.AppCompat.DayNight">
        <item name="android:textColor">@color/primarytextColor</item>
        <item name="android:editTextStyle">@style/IdnowSdkTheme.EditText</item>
    </style>

        <style name="IdnowSdkTheme.EditText" parent="android:Widget.EditText">
        <item name="android:textColor">@color/primarytextColor</item>
        <item name="android:colorBackground">@color/bgSecondaryColor</item>
    </style>

</resources>
```

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

#### Fonts

```
   setDefaultFont(Context context, String staticTypefaceFieldName, String fontAssetName)
```
Here an example on how to set custom font
	
```
  FontsOverride.setDefaultFont(this, "SERIF", "roboto_thin_italic.ttf");
	
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

in `build.gradle` file add the following instructions:

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
compile 'de.idnow.android.eid:idnow-android-eid-sdk:x.x.x'
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
        maven { url 'https://jitpack.io' }
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
    implementation 'androidx.legacy:legacy-support-v4:1.0.0'
    implementation 'androidx.annotation:annotation:1.3.0'
    implementation 'androidx.appcompat:appcompat:1.4.1'
    implementation 'androidx.constraintlayout:constraintlayout:2.0.4'
    implementation 'com.squareup.retrofit:retrofit:1.9.0'
    implementation 'com.squareup.okhttp3:okhttp:3.12.1'
    implementation  'com.google.code.gson:gson:2.8.6'
    implementation 'de.idnow.insights:idnow-android-insights-sdk:1.2.0'
    implementation 'com.airbnb.android:lottie:5.1.1'
    implementation 'androidx.cardview:cardview:1.0.0'
    implementation 'com.google.android.material:material:1.5.0'
    implementation 'com.googlecode.libphonenumber:libphonenumber:8.10.9'
    implementation 'com.github.barteksc:android-pdf-viewer:2.6.0'
    implementation group: 'de.authada.library', name: 'aal', version: '4.15.2'
    testImplementation 'junit:junit:4.12'
	
	
} 
```

### eID usage

eID is not offered as a standalone product. Therefore, in order to use eID, you will need to integrate the VideoIdent SDK. Please refer to the [Usage example](https://github.com/idnow/de.idnow.android?tab=readme-ov-file#usage) in the VideoIdent part of the SDK documentation. No separate installation is needed for eID usage.

### eID Colors

colors are customisable by overriding the values of a specific key

#### primaryColor
Used as default color of the App and the component such as the buttons

#### primaryVariantColor
Used as a deactivated color for the buttons, it should use same value as primaryColor with a transparent code.

#### primarytextColor
Used as a text color for the whole App

#### bgPrimaryColor
Used as background color for the screens.

#### bgSecondaryColor
Used as background color for the text fields

#### basicInputField
Used as text color for the text fields


<?xml version="1.0" encoding="utf-8"?>
<resources>

    <!-- Primary color is used for the brand color -->
    <color name="primaryColor">#DE6240</color>
     <!-- PrimaryVariant color is used for the transparent brand color  -->
    <color name="primaryVariantColor">#80DE6240</color>
    <!-- background primary color is used for the background color -->
    <color name="bgPrimaryColor">#32343F</color>
    <!-- background secondary color is used for the text field background -->
    <color name="bgSecondaryColor">#39414A</color>
    <!-- background primarytext color is used for the main text color -->
    <color name="primarytextColor">#FFFFFF</color>
    <!-- basic inputfield color is used for the textfield text color -->
    <color name="basicInputField">#AAA7A8</color>

</resources>
