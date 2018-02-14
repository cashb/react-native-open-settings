package com.opensettings;

import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class OpenSettings extends ReactContextBaseJavaModule {

    private static final Map<String, String> actions;
    static {
        Map<String, String> m = new HashMap<>();
        m.put("bluetooth", android.provider.Settings.ACTION_BLUETOOTH_SETTINGS);
        m.put("location", android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
        actions = Collections.unmodifiableMap(m);
    }
    

    private ReactContext reactContext;

    public OpenSettings(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNOpenSettings";
    }

    //region React Native Methods
    @ReactMethod
    public void openSettings() {
        final Intent i = new Intent();
        i.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
        i.addCategory(Intent.CATEGORY_DEFAULT);
        i.setData(Uri.parse("package:" + reactContext.getPackageName()));
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        i.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        i.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
        reactContext.startActivity(i);
    }

    @ReactMethod
    public void openSettingsFor(String type) {
        final String action = actions.get(type);
        if (action == null) return;

        final Intent i = new Intent();
        i.setAction(action);
        reactContext.startActivity(i);
    }
    //endregion
}
