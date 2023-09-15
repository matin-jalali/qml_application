import QtQuick 2.12
import QtGraphicalEffects 1.0

Rectangle {
    id: control
    width: 100
    height: 100
    border.color: "transparent"
    color: "transparent";
    //    property double radius: 8.;
    property url source: "";
    property bool is_glow: true;
    property color glow_color: "#99888888";

    RectangularGlow {
        id: effect;
        visible: control.is_glow;
        anchors.fill: control;
        glowRadius: 3;
        spread: 0.3;
        color: control.glow_color;
        cornerRadius: control.radius + glowRadius;
    }

    Image {
        id: img;
        width: parent.width;
        height: parent.height;
        source: control.source;
        visible: false; // this is needed or the corners of the image will be visible underneath the opacity mask
        anchors.centerIn: parent;
    }

    OpacityMask {
        anchors.fill: img
        source: img
        anchors.centerIn: parent;
        maskSource: Rectangle {
            width: img.width
            height: img.height
            radius: control.radius;
            anchors.centerIn: parent;
            visible: false // this also needs to be invisible or it will cover up the image
        }
    }
}
