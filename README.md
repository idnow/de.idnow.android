## Requirements

- minSdkVersion: 14  (Android 4.0 IceCreamSandwich)
- targetSdkVersion:	19 (Android 4.2 Kitkat)
- Internet connection, communication via standard SSL port 443

## AndroidManifest

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

Additional permissions for tokbox:

```
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
```

Moreover, when using an Android LibraryProject, all the Activities, Services and <uses-feature> from the LibraryProject (SDK) have to be mentioned in your Apps AndroidManifest. The simplest way is just to copy the corresponding part of the IDnowSDK AndroidManifest.

## Preparation for Eclipse

The project directory is ready to use for Eclipse.
If you haven't installed Eclipse, download and install Eclipse, the Android SDK and the Eclipse ADT
plugin (see http://code.google.com/android/intro/installing.html for more details)
then start Eclipse.

Import the SDK into your workspace:
For importing select the "existing projects into workspace" option, and browse to the directory of the IDnowSDK-project.
The SDK should then be imported as a library project and should be ready to use.

## BUILDING

For the betaVersion of the SDK, the Crashlytics Plugin has to be installed in Eclipse (http://download.crashlytics.com/android/eclipse/).
This plugin tracks crashes and will be removed in the final SDK version. 
Note: don't forget to add the meta-data with the crashlytics api-key into the manifest.

Used libs (these are already added into the project, one doesn't have to set up anything more)
- Socket Communication - Atmosphere: https://github.com/Atmosphere/wasync
- okHttp and Retrofit: http://square.github.io/retrofit/
- OpenTokAndroidSDK 2.4.1 (https://tokbox.com/opentok/libraries/client/android/)

## Example

Please see https://github.com/idnow/de.idnow.android-sample for a sample application

## Usage

The SDK is distributed as an Android Library Project.
After importing the Project in your workspace, go to "Android" in your Project Preferences and add the project as a Library.

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
	IDnowSDK.showVideoOverviewCheck(true, context);
	
	// Same goes to the success screen. If none is shown, the app sends the results right back.
	// The defaults for the both parameters are "true";
	IDnowSDK.showErrorSuccessScreen(true, context);

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
