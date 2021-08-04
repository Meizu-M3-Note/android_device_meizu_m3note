package com.cyanogenmod.settings.device;

import android.content.Context;
import android.preference.SwitchPreference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;

/**
 * Custom preference for handling a switch with a clickable preference area as well
 *
 * Source: https://gist.github.com/marchold/45e22839eb94aa14dfb5
 */
public class SwitchPlusPreference extends SwitchPreference {

    //
    // Public interface
    //

    /**
     * Sets listeners for the switch and the background container preference view cell
     *
     * @param listener A valid SwitchPlusClickListener
     */
    public void setSwitchClickListener(SwitchPlusClickListener listener) {
        this.listener = listener;
    }

    private SwitchPlusClickListener listener = null;

    /**
     * Interface gives callbacks in to both parts of the preference
     */
    public interface SwitchPlusClickListener {
        /**
         * Called when the switch is switched
         *
         * @param preference
         * @param isChecked
         */
        public void onCheckedChanged(SwitchPlusPreference preference, boolean isChecked);

        /**
         * Called when the preference view is clicked
         *
         * @param view
         * @param preference
         */
        public void onClick(View view, SwitchPlusPreference preference);
    }

    public SwitchPlusPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public SwitchPlusPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public SwitchPlusPreference(Context context) {
        super(context);
    }


    //
    // Internal Functions
    //

    /**
     * Recursively go through view tree until we find an android.widget.Switch
     *
     * @param view Root view to start searching
     * @return A Switch class or null
     */
    private Switch findSwitchWidget(View view) {
        if (view instanceof Switch) {
            return (Switch) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                View child = viewGroup.getChildAt(i);
                if (child instanceof ViewGroup) {
                    Switch result = findSwitchWidget(child);
                    if (result != null) return result;
                }
                if (child instanceof Switch) {
                    return (Switch) child;
                }
            }
        }
        return null;
    }

    //Get a handle on the 2 parts of the switch preference and assign handlers to them
    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        final SwitchPlusPreference that = this;

        final Switch switchView = findSwitchWidget(view);
        if (switchView != null) {
            switchView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (listener != null)
                        listener.onCheckedChanged(that, ((Switch) v).isChecked());
                }
            });
            switchView.setChecked(getSharedPreferences().getBoolean(getKey(), false));
            switchView.setFocusable(true);
            //switchView.setEnabled(true);
        }


        view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (listener != null) listener.onClick(v, that);
            }
        });
    }
}

