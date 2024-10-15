
# Table of Contents

- [Requirements](#requirements)
- [Supported Architecture](#supported-architecture)
- [Compatibility, End of Support, End of Life](#compatibility-matrix)
- [Installation](#installation)
  - [Import library](#1-import-library)
  - [Import using Maven](#option-1-maven)
  - [Import using AAR file](#option-2-aar-file)
  - [Import BouncyCastle](#2-import-bouncycastle)
- [Usage](#usage)
  - [Setup and run](#setup-and-run)
  - [Additional settings](#additional-settings)
  - [Custom certificate providers](#custom-certificate-providers)
    - [DTLS](#dtls)
    - [mTLS](#mtls)
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
- [Other Supported Platforms](#other-supported-platforms)
  - [Cordova](#cordova)
  - [React native](#react-native)
- [eID Framework](#eid-framework)
- [Examples](#examples)


## Requirements

- Android Studio;
- Deployment target: Android 6.0 or later;
- In order for end-users to have a seamless experience, the device needs to have the animation capability enabled, otherwise screens that contain animations will not function as intended;
- We are using foreground services in our SDK to perform a task that is required in the process of connecting the end-user with the identification expert, as it is a prerequisite for the video call.
  You’ll need to mention the following foreground service permissions on the App content page (Policy > App content) in Play Console: `FOREGROUND_SERVICE_CAMERA` and `FOREGROUND_SERVICE_MICROPHONE`.

## Supported Architecture

Different Android devices use different CPUs, which in turn support different instruction sets.

Currently we support the following architectures:
- arm64-v8a
- armeabi-v7a.

For further reading: http://developer.android.com/ndk/guides/abis.html.

## Compatibility Matrix

Please refer to the following link to find information about compatibility, end-of-support (EOS) and end-of-life (EOL) dates pertaining to our products: [IDnow Compatibility Matrix: Browser & OS Compatibility guide](https://www.idnow.io/developers/compatibility-overview/)

## Installation

Download the latest version of the [VideoIdent SDK](https://github.com/idnow/de.idnow.android/releases).

### 1. Import library

#### Option 1: Maven

Add the following repository and dependency to your build.gradle file:

```
allprojects {
    repositories {
        maven {
            url "https://raw.githubusercontent.com/idnow/de.idnow.android/master"
        }
    }
} 

dependencies {
    implementation('de.idnow.sdk:idnow-android:x.x.x')
}
```

#### Option 2: AAR file

We also offer the possibility to import the SDK as an .aar file instead.

Copy the `idnow-android-sdk-x.x.x.aar` file into the `libs` folder, then add the following repositories and dependency to your build.gradle file:

```
allprojects {
    repositories {
        maven {
            url "https://raw.githubusercontent.com/idnow/de.idnow.android/master"
        }
        flatDir {
            dirs 'libs'
        }
    }
}

dependencies {
    implementation files('libs/idnow-android-sdk-x.x.x.aar')
} 
```

### 2. Import BouncyCastle

Starting with SDK version 7.0.0 we offer the possibility to integrate your bouncycastle preferred version as an external library.
We offer the BouncyCastle version 1.64 as a default (only compile) used version, therefore integrating it as external library is mandatory for the runtime.
If you don't have any BouncyCastle version preferences, you can use the following https://github.com/idnow/de.idnow.android-sample/tree/master/app/libs

Copy `bcprov-jdk15to18-164.jar` and `bctls-jdk15to18-164.jar` files into the `libs` folder, then add the following repositories and dependencies to your build.gradle file:

```
allprojects {
    repositories {
        flatDir {
            dirs 'libs'
        }
    }
}

dependencies {
    implementation files('libs/bcprov-jdk15to18-164.jar')
    implementation files('libs/bctls-jdk15to18-164.jar')
} 
```

## Usage

### Setup and run

After adding the IDnowSDK into your project you need to follow these steps in order to start an identification process.

#### Step 1. Initialize SDK
```
IDnowSDK.getInstance().initialize(<Activity>, "<companyid>");
```

#### Step 2. Start SDK
```
try {
    IDnowSDK.getInstance().initialize(StartActivity.this, "companyId");

    ...
    //Additional settings
    ...

    IDnowSDK.getInstance().start(IDnowSDK.getTransactionToken());
} catch (Exception e) {
    e.printStackTrace();
}
```

The SDK checks the input parameters and throws an Exception if something is deemed not right, to provide you with quick feedback. Handle it as desired.

To handle the results of the identification, implement the standard onActivityResult function in your activity:

```
     @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == IDnowSDK.REQUEST_ID_NOW_SDK) {
            if (resultCode == IDnowSDK.RESULT_CODE_SUCCESS) {
                if (data != null) {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    Log.v(TAG, "success, transaction token: " + transactionToken);
                }
            } else if (resultCode == IDnowSDK.RESULT_CODE_CANCEL) {
                if (data != null) {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    String errorMessage = data.getStringExtra(IDnowSDK.RESULT_DATA_ERROR);
                    Log.v(TAG, "canceled, transaction token: " + transactionToken + ", error: "
                    +errorMessage);
                }
            } else if (resultCode == IDnowSDK.RESULT_CODE_FAILED) {
                if (data != null) {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    String errorMessage = data.getStringExtra(IDnowSDK.RESULT_DATA_ERROR);
                    Log.v(TAG, "failed, transaction token: " + transactionToken + ", error: "
                    +errorMessage);
                }
            } else {
                Log.v(TAG, "Result Code: " + resultCode);
            }
        }
    }

```

### Additional settings

| Property name           | Description       |
| ------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| setTransactionToken        | A token that will be used for instantiating a video identification.                                                                            | setCompanyId               | Your Company ID provided by IDnow.|
| setEnvironment             | **Optional:** The environment that should be used for the identification (DEV, TEST, LIVE) The default value is `null`. The used environment will then base on the prefix of the transaction token (DEV -> DEV, TST -> Test, else -> Live). You can use the special IDnowEnvironmentCustom to define a custom IDnow installation. If this is done, you need to set the apiHost and websocketHost. |
 setShowErrorSuccessScreen  | **Optional:** If set to `false`, the Error-Success-Screen provided by the SDK will not be displayed. <br />The default value of this property is `true`. |
| setShowVideoOverviewCheck  | **Optional:** If set to `false`, the `Terms and Conditions` screen will not be shown before starting a video identification. <br />The default value of this property is `true`. |
| setApiHost                 | The target server url for REST calls if custom server is used. |
| setWebsocketHost           | The target server url for websocket calls if custom server is used.                                                                                                                                                                                                                                                                                                                                                    |
| setConnectionType          | The connection type to use to talk the backend.`ConnectionType` <br />Possible values:<br />- WEBSOCKET *(default)*<br />- LONG_POLLING                                                                                                                                                                                                                                      |
| setCertificateProvider     | Accepts a subclass of `CertificateProvider`. Used to provide custom mTLS certificates used by the network connections. See [Custom certificate providers](#custom-certificate-providers). |
| setDtlsCertificateProvider | Accepts a subclass of `CertificateProvider`. Used to provide custom DTLS certificates used by the WebRTC connection. See [Custom certificate providers](#custom-certificate-providers).                                                                                                                            
| logging | ```enableLogging``` or ```disableLogging``` methods are used to toggle logging.<br> The default value of this property is `true`. |

### Custom certificate providers

#### DTLS

Starting from SDK version 7.2.0 we offer to set your own DTLS certificates used by the WebRTC connection.
```
IDnowSDK.setDtlsCertificateProvider(certificateProvider);
```    
The certificate provider needs to:
- be a subclass of `CertificateProvider`
- enable  `featureCertificate` flag
- override `provideCertificateBytestream` method (raw data of the certificate file).

#### mTLS

Starting from SDK version 6.5.0 we offer MTLS support for API connections.
 ```
 IDnowSDK.setCertificateProvider(certificateProvider);
 ```    
The certificate provider needs to:
- be a subclass of `CertificateProvider`
- enable  `featureCertificate` flag
- override `providePrivateKeyBytestream` method (raw data of *.der private key file)
- override `provideCertificateBytestream` method (raw data of .der certificate file)
- enable `featureFingerPrint` and/or `featureServerCert` flag(s)
- override `provideServerFingerPrintByteStreams` and/or `provideServerCertificateBytestreams` method(s) (row data list of fingerprint/certificate files).

**Notes:**
<br>***- CertificateProvider can validate multiple server certificates/fingerprints.***
<br>***- Certificates should be imported in .der format.***

## Using IDnow with other native libraries (UnsatisfiedLinkError)

For Videostreaming the Idnow SDK uses IceLink which come with native libs.

If your app uses other 3rd party libs that come with their own native libs, it's possible that you get an UnsatisfiedLinkError.

This means that the native lib folders shipped by your 3rd party lib don't match the native lib folders shipped by the Idnow SDK.
Currently the Idnow SDK comes with the following folders: armeabi-v7a, arm64-v8a.
If your 3rd party lib only supports some of the architectures but not others (e.g. armeabi, but not armeabi-v7a), you have to exclude the other folders of the Idnow SDK in your build.gradle (in this example: armeabi-v7a) with the following command:

```
android {
    packagingOptions {
        exclude "lib/armeabi-v7a/"
    }
}
```

If it's the other way round (your 3rd party lib ships more than armeabi, armeabi-v7a, arm64-v8a, you have to exclude these folders, so the remaining folders match the Idnow SDK folders.

For further reading:
http://developer.android.com/ndk/guides/abis.html


Additionally, a video is often required to demonstrate how the app uses the foreground service.

Please contact the support team in case that video is needed.

### branding

You can set the new branding (Circular background for the buttons)

```
IDnowSDK.setNewBrand(TRUE);
    
```

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

## Other supported platforms

### Cordova

Our Cordova plugin offers the possibility of integrating our native Android and iOS SDK into the Cordova-based applications. The plugin offers the possibility to customize and setup of the SDK. At the end of the identification process, the SDK communicates with the plug-in via a callback, allowing the Cordova application to update the flow.
Please refer to this [link](https://www.npmjs.com/package/com-idnow-plugin) for implementation details.\
**Note**: Only VideoIdent and eSign are supported so far. eID is not supported.

### React native

Our React Native plug-in offers the possibility of integrating our native Android and iOS SDK into the React Native-based applications. It offers the possibility to customize and setup the SDK, and uses the latest expo native modules to create the bridging mechanism.
Please refer to this [link](https://www.npmjs.com/package/react-native-vi-idnow-library) for implementation details.\
**Note**: Only VideoIdent and eSign are supported so far. eID is not supported.

## eID Framework

IDnow eID is an automated and fully AML-compliant identification product. All it requires is an NFC-enabled (Near Field Communication) smartphone and a German ID document (ID card or Residence permit) with an activated eID function or the eID card for EU citizens.

For configuration details, please refer to the [IDnow eID SDK Documentation](./de/idnow/android/eid/README.md)

## Examples

Please see https://github.com/idnow/de.idnow.android-sample for a sample applications.