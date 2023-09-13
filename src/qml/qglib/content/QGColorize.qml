import QtQuick 2.12
import QtGraphicalEffects 1.0

Item {
    id: control;

    //..DONT USE FILL
    width: parent.width;
    height: parent.height;

    property url source;
    property color color;
    property bool is_mouse_enable: true;

    signal clicked();
    signal doubleClicked();

    Image {
        id: image;
        anchors.fill: parent;
        source: control.source;
        visible: false;
    }
    Colorize {
        anchors.fill: image;
        source: image;
        hue: control.color.hslHue;
        saturation: control.color.hslSaturation;
        lightness: control.color.hslLightness;
        anchors.centerIn: parent;
    }
    MouseArea {
        id: mousearea
        anchors.fill: parent;
        cursorShape: control.is_mouse_enable ?
                         Qt.PointingHandCursor :
                         Qt.ArrowCursor;
        onClicked: control.clicked();
        onDoubleClicked: control.doubleClicked();
    }
}
