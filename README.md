## Overview

This SDK supports AndroidStudio and Eclipse. Please note that the Eclipse support might have less features than the Android Studio version. If possible please use the Android Studio version.

### Examples

Please see https://github.com/idnow/de.idnow.android-sample for a sample applications

- For Eclipse: https://github.com/idnow/de.idnow.android-sample/tree/Eclipse
- For Android Studio: https://github.com/idnow/de.idnow.android-sample

### Requirements

- minSdkVersion: 14  (Android 4.0 IceCreamSandwich)
- targetSdkVersion:	19 (Android 4.2 Kitkat)
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

    compile 'com.android.support:support-v4:23.0.0'
    compile 'com.google.code.gson:gson:2.2.4'
    compile 'org.atmosphere:wasync:1.4.1'
    compile 'org.slf4j:slf4j-android:1.7.12'
    compile 'com.squareup.retrofit:retrofit:1.9.0'
    compile 'com.fasterxml.jackson.core:jackson-core:2.6.0-rc3'
    compile 'com.fasterxml.jackson.core:jackson-annotations:2.6.0-rc3'
    compile 'com.fasterxml.jackson.core:jackson-databind:2.6.0-rc3'
```

## Eclipse

### Preparation for Eclipse

The project directory is ready to use for Eclipse.
If you haven't installed Eclipse, download and install Eclipse, the Android SDK and the Eclipse ADT
plugin (see http://code.google.com/android/intro/installing.html for more details)
then start Eclipse.

Import the SDK into your workspace:
For importing select the "existing projects into workspace" option, and browse to the directory of the IDnowSDK-project.
The SDK should then be imported as a library project and should be ready to use.

### BUILDING

For the betaVersion of the SDK, the Crashlytics Plugin has to be installed in Eclipse (http://download.crashlytics.com/android/eclipse/).
This plugin tracks crashes and will be removed in the final SDK version. 
Note: don't forget to add the meta-data with the crashlytics api-key into the manifest.

Used libs (these are already added into the project, one doesn't have to set up anything more)
- Socket Communication - Atmosphere: https://github.com/Atmosphere/wasync
- okHttp and Retrofit: http://square.github.io/retrofit/
- OpenTokAndroidSDK 2.4.1 (https://tokbox.com/opentok/libraries/client/android/)

The SDK is distributed as an Android Library Project.
After importing the Project in your workspace, go to "Android" in your Project Preferences and add the project as a Library.

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
IDnowSDK.showVideoOverviewCheck(<true/false>, <Context>);
IDnowSDK.showErrorSuccessScreen(<true/false>, <Context>);
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
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    if (requestCode == IDnowSDK.REQUEST_IDNOW_SDK) {
        switch(resultCode) {
            case IDnowSDK.RESULT_CODE_SUCCESS:
                If (data != null) {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    Log.v(TAG, "success, transaction token: " + transactionToken);
                }
                break;
            case IDnowSDK.RESULT_CODE_CANCEL:
                if (data != null) {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_TOKEN);
                    String errorMessage = data.getStringExtra(IDnowSDK.RESULT_DATA_ERROR);
                    Log.v(TAG, "canceled, transaction token: " + transactionToken + “, error: “ + errorMessage);
                }
                break;
            case IDnowSDK.RESULT_CODE_FAILED:
                if (data != null) {
                    String transactionToken = data.getStringExtra(IDnowSDK.RESULT_DATA_TRANSACTION_NUMBER);
                    String errorMessage = data.getStringExtra(IDnowSDK.RESULT_DATA_ERROR);
                    Log.v(TAG, "failed, transaction Token: " + transactionToken + “, error: “ + errorMessage);
                }
                break;
            }
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

You can set to use your own servers. When this setting is enabled, apiHost, webHost and websocketHost must also be set.

```
IDnowSDK.setEnvironment(IDnowSDK.Server.CUSTOM);
IDnowSDK.setApiHost("https://api.yourserver.com", context);
IDnowSDK.setWebHost("https://www.yourserver.com", context);
IDnowSDK.setWebsocketHost("https://websocket.yourserver.com", context);
```

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