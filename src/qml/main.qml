import QtQuick 2.9
import "qglib/content" as QGlib
import "constants"


import QtQuick 2.2 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

QGlib.QGWindow {
    id: main_window;
    title: Constants.project_name;
    width: Constants.width/1.5;
    height: Constants.height/1.5;
    header_height: Constants.header_status_height;
    visible: true;
    visibility: "Maximized";
    onExited: Qt.quit();
    contentItem: Rectangle { id: _app; anchors.fill: parent; color: "#202020"; }
    footer: null;
}
