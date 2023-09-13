import QtQuick 2.0

Rectangle {
    x: parent.width / 4.5
    y: parent.height / 4.5
    width: parent.width / 3.;
    Behavior on width {NumberAnimation{duration: 500; easing.type: Easing.OutQuad;}}
    height: 50;
    color: "red";
}
