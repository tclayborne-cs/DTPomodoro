public class Pomodoro : Gtk.Application { //Pomodoro extends Gtk.Application class
    public static GLib.Settings settings;

    public Pomodoro() {
        Object(application_id: "com.github.DreamTeam999.Pomodoro", flags: ApplicationFlags.FLAGS_NONE);
    }

    static construct {
        //setup gsettings as a global obj
        settings = new GLib.Settings("com.github.DreamTeam999.Pomodoro");
    }

    protected override void activate() {
        //new window object as defined in Window.vala
        var window = new Pomo.Window(this);
        var winx = settings.get_int("position-x");
        var winy = settings.get_int("position-y");

        if (winx != -1 ||  winy != -1)
            window.move(winx, winy);
        window.resize(settings.get_int("window-width"), settings.get_int("window-height"));
        window.window_position = Gtk.WindowPosition.CENTER;

        add_window(window);

    }
}

public static int main(string[] args) {
        // Create new Pomodoro object defined in Pomodoro.vala
        Pomodoro pomo = new Pomodoro();
        return pomo.run(args);
    }

