import QtQuick 2.12
import QtGraphicalEffects 1.0

Item {
    height: (parent.height - (_header.height + _header.y))/2;
    width: parent.width/2;
    y: _header.height + _header.y;

    Rectangle {
        id: rect
        width: parent.width - 5;
        height: parent.height - 15;
        radius: 5;
        anchors.centerIn: parent;
        gradient: Gradient{
            GradientStop{position: 0; color: "#99222126"; }
            GradientStop{position: 1; color: "#99151517"; }
        }

    }
}
