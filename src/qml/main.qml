import "qglib/content" as QGlib
import "constants"
import "main_window"

QGlib.QGWindow {
    id: main_window;
    title: Constants.project_name;
    width: Constants.width/1.5;
    height: Constants.height/1.5;
    header_height: Constants.header_status_height;
    visible: true;
    visibility: "Maximized";
    onExited: Qt.quit();
    contentItem: App { }
    footer: null;
}
