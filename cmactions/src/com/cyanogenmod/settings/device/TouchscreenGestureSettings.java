/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.view.MenuItem;
import android.view.View;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TouchscreenGestureSettings extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        final ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);

        getFragmentManager().beginTransaction()
                .replace(android.R.id.content, new GestureFragment())
                .commit();
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            onBackPressed();
            return true;
        }
        return false;
    }

    public static class GestureFragment extends PreferenceFragment implements SwitchPlusPreference.SwitchPlusClickListener {

        public static final String TAG = GestureFragment.class.getSimpleName();

        private SharedPreferences sharedPrefs;
        private String[] actionTitles;
        private String[] actionValues;
        private List<String> actionTitlesList;
        private List<String> actionValuesList;
        private static final List<String> allowedSystemApps = new ArrayList<>();

        static {
            allowedSystemApps.add("com.android.dialer");
            allowedSystemApps.add("com.android.mms");
            allowedSystemApps.add("com.android.settings");
            allowedSystemApps.add("com.android.deskclock");
            allowedSystemApps.add("com.android.calculator2");
        }

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            addPreferencesFromResource(R.xml.touchscreen_panel);
            sharedPrefs = PreferenceManager.getDefaultSharedPreferences(getActivity());

            actionTitlesList = new ArrayList<>();
            actionValuesList = new ArrayList<>();
            actionTitles = this.getResources().getStringArray(R.array.gesture_action_titles);
            actionValues = this.getResources().getStringArray(R.array.gesture_action_values);
            actionTitlesList.addAll(Arrays.asList(actionTitles));
            actionValuesList.addAll(Arrays.asList(actionValues));

            List<ApplicationInfo> packages = getActivity().getPackageManager()
                    .getInstalledApplications(PackageManager.GET_META_DATA);
            for (ApplicationInfo appInfo : packages) {
                if ((appInfo.flags & ApplicationInfo.FLAG_SYSTEM) != 0 &&
                        allowedSystemApps.indexOf(appInfo.packageName) == -1)
                    continue;
                actionTitlesList.add(appInfo.loadLabel(getActivity().getPackageManager()).toString());
                actionValuesList.add("launch$" + appInfo.packageName);
            }
            actionTitles = actionTitlesList.toArray(new String[actionTitlesList.size()]);
            actionValues = actionValuesList.toArray(new String[actionValuesList.size()]);
            for (int x = 0; x < GestureController.keysToMasks.size(); x++) {
                int prefKey = GestureController.keysToMasks.keyAt(x);
                SwitchPlusPreference preference = (SwitchPlusPreference) findPreference(String.valueOf(prefKey) + "_enabled");
                preference.setSwitchClickListener(this);
                String prefValue = sharedPrefs.getString(String.valueOf(prefKey) + "_action", "disabled");
                int i = actionValuesList.indexOf(prefValue);
                if (i >= 0)
                    preference.setSummaryOn(actionTitles[i]);
                else
                    preference.setSummaryOn(" ");
            }

            findPreference(GestureController.TOUCHSCREEN_GESTURE_CONTROL_KEY).setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
                @Override
                public boolean onPreferenceChange(Preference preference, Object o) {
                    boolean newValue = (boolean) o;
                    GestureController.masterSwitch(newValue);
                    return true;
                }
            });
        }

        @Override
        public void onCheckedChanged(SwitchPlusPreference preference, boolean isChecked) {
            GestureController.updateGestureControl(getActivity());
        }

        @Override
        public void onClick(View view, final SwitchPlusPreference preference) {
            if (!preference.isChecked()) return;

            String prefValue = sharedPrefs.getString(preference.getKey().replace("_enabled", "_action"), "disabled");
            int i = actionValuesList.indexOf(prefValue);
            AlertDialog dialog = new AlertDialog.Builder(getActivity()).setSingleChoiceItems(actionTitles, i, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    preference.setSummaryOn(actionTitles[which]);
                    sharedPrefs.edit().putString(preference.getKey().replace("_enabled", "_action"),
                            actionValues[which]).apply();
                    dialog.dismiss();
                }
            }).create();
            dialog.show();
        }
    }
}


