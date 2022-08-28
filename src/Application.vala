/*
* SPDX-License-Identifier: GPL-3.0-or-later
* SPDX-FileCopyrightText: 2022 Josip Antoliš <josip.antolis@protonmail.com.>
*/

public class MyApp : Gtk.Application {

    private Gtk.ApplicationWindow main_window;

    public MyApp () {
        Object (
            application_id: "com.github.antolius.demo",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    public override void startup () {
        base.startup ();

        var lock_action = new SimpleAction ("lock", null);
        add_action (lock_action);
        set_accels_for_action ("app.lock",  {"<Control>l"});
        lock_action.activate.connect (on_lock);

        var unlock_action = new SimpleAction ("unlock", null);
        add_action (unlock_action);
        set_accels_for_action ("app.unlock",  {"<Control>u"});
        unlock_action.activate.connect (on_unlock);

        main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "Actions launcher demo"
        };

        main_window.present ();
    }

    public override void activate () {
        main_window.child = new Gtk.Image () {
            gicon = new ThemedIcon ("dialog-question"),
            pixel_size = 64
        };
    }

    private void on_lock () {
        main_window.child = new Gtk.Image () {
            gicon = new ThemedIcon ("changes-prevent"),
            pixel_size = 64
        };
    }

    private void on_unlock () {
        main_window.child = new Gtk.Image () {
            gicon = new ThemedIcon ("changes-allow"),
            pixel_size = 64
        };
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
