package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceManager;
import java.io.DataOutputStream;

public class Int2Ext {

    private static final String SCRIPT_NAME = "40int2ext";
    private static final String SDEXT_PATH = "/dev/block/mmcblk0p2";
    private static final String SRC_FILE = String.format("/system/etc/%s", SCRIPT_NAME);
    private static final String DST_PATH = "/system/etc/init.d";

    public static boolean isSupported() {
        return (Utils.fileExists(SDEXT_PATH) && Utils.fileExists(SRC_FILE) 
               && !(Utils.fileExists(String.format("%s/%s", DST_PATH, SCRIPT_NAME))));
    }

    public static boolean isEnabled() {
        return Utils.fileExists(DST_PATH.concat(String.format("/%s", SCRIPT_NAME)));
    }

    public static void enable(Context context) {
        String enableCmds[] = {"mount -o rw,remount /system",
                             String.format("cp %s %s", SRC_FILE, DST_PATH),
                             String.format("chmod 755 %s/%s", DST_PATH, SCRIPT_NAME),
                             "reboot"
                            };
        if (!isSupported())
            return;
        

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPrefs.edit();
        editor.putBoolean(DevicePreferenceActivity.KEY_INT2EXT, true);
        editor.commit();
	RunAsRoot(enableCmds);
    }

    public static void disable(Context context) {
       
    }

    public static void RunAsRoot(String[] cmds){
	try {
                Process p = Runtime.getRuntime().exec("su");
                DataOutputStream os = new DataOutputStream(p.getOutputStream());            
                for (String tmpCmd : cmds) {
                    os.writeBytes(tmpCmd+"\n");
                }           
                os.writeBytes("exit\n");  
                os.flush();
            }
            catch(Exception e) {};

    }

}
