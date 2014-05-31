/*
 * Copyright (C) 2011 The CyanogenMod Project
 * Copyright (C) 2013 Mustaavalkosta
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

import android.content.Context;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import com.cyanogenmod.settings.device.R;

public class DevicePreferenceActivity extends PreferenceFragment implements
        OnPreferenceChangeListener {

    public static final String KEY_FAST_CHARGE = "fast_charge";
    public static final String KEY_INT2EXT = "int2ext";
    public static final String KEY_SWEEP2WAKE = "sweep2wake";
    public static final String KEY_DOUBLETAP2WAKE = "doubletap2wake";

    private Context context;
    private CheckBoxPreference mFastCharge;
    private CheckBoxPreference mInt2Ext;
    private SwitchPreference mSweep2Wake;
    private SwitchPreference mDoubleTap2Wake;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.preferences);
        context = getActivity().getApplication();

        mFastCharge = (CheckBoxPreference) findPreference(KEY_FAST_CHARGE);
        mFastCharge.setChecked(FastCharge.isEnabled());
        mFastCharge.setEnabled(FastCharge.isSupported());

        mInt2Ext = (CheckBoxPreference) findPreference(KEY_INT2EXT);
        mInt2Ext.setChecked(Int2Ext.isEnabled());
        mInt2Ext.setEnabled(Int2Ext.isSupported());
        mInt2Ext.setOnPreferenceChangeListener(this);

        mSweep2Wake = (SwitchPreference) findPreference(KEY_SWEEP2WAKE);
        mSweep2Wake.setChecked(Sweep2Wake.isEnabled());
        mSweep2Wake.setEnabled(Sweep2Wake.isSupported());
        mSweep2Wake.setOnPreferenceChangeListener(this);

        mDoubleTap2Wake = (SwitchPreference) findPreference(KEY_DOUBLETAP2WAKE);
        mDoubleTap2Wake.setChecked(DoubleTap2Wake.isEnabled());
        mDoubleTap2Wake.setEnabled(DoubleTap2Wake.isSupported());
        mDoubleTap2Wake.setOnPreferenceChangeListener(this);
    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference == mFastCharge) {
            if (mFastCharge.isChecked())
                FastCharge.enable(context);
            else
                FastCharge.disable(context);
            return true;
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (preference == mSweep2Wake) {
            boolean value = ((Boolean)newValue).booleanValue();
            if (value)
                Sweep2Wake.enable(context);
            else
                Sweep2Wake.disable(context);
            return true;
        } else if (preference == mDoubleTap2Wake) {
            boolean value = ((Boolean)newValue).booleanValue();
            if (value)
                DoubleTap2Wake.enable(context);
            else
                DoubleTap2Wake.disable(context);
            return true;
        } else if (preference == mInt2Ext) {
            boolean value = ((Boolean)newValue).booleanValue();
            if (value)
                Int2Ext.enable(context);
            else
                Int2Ext.disable(context);
        }
        return false;
    }
}
