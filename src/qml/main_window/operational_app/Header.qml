import QtQuick 2.12
import QtGraphicalEffects 1.0
import "../../constants"
import "../../qglib/content" as QGlib

Item {
    id: _header;
    width: parent.width;
    height: 2*Constants.header_status_height;
    y: Constants.header_status_height

    Rectangle {
        id: rect
        width: parent.width - 15;
        height: parent.height - 5;
        radius: 5;
        anchors.centerIn: parent;
        gradient: Gradient{
            GradientStop{position: 0; color: "#99222126";}
            GradientStop{position: 1; color: "#99151517";}
        }
    }

}

