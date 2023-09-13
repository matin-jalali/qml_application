import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import "../qglib/content" as QGlib
import "../constants"
import "menu"

Rectangle {
    id: _app;
    anchors.fill: parent;
    color: "#202020";

    QGlib.QGColorize {
        id: _menu_background;
        anchors.fill: parent;
        source: "../assets/menu_background.jpg";
        color: "#202020";
    }
    FastBlur {
        anchors.fill: _menu_background;
        source: _menu_background;
        radius: 120;
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 20;
        y: parent.height / 4.5;
        Behavior on y {NumberAnimation{duration: 500; easing.type: Easing.OutQuad;}}
        Label {
            anchors.horizontalCenter: parent.horizontalCenter;
            text: "Welcome back to " + Constants.project_name;
            font.pixelSize: 40;
            font.bold: true;
            font.letterSpacing: .5;
            color: "white";
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter;
            text: "Who's using this controller ?";
            font.pixelSize: 25;
            font.letterSpacing: .5;
            color: "white";
        }
    }/*column*/

    Item {
        anchors.horizontalCenter: parent.horizontalCenter;
        y: parent.height - (parent.height / 3.5);
        width: 660; height: 130
        clip: true;
        Behavior on width {NumberAnimation{duration: 500; easing.type: Easing.InCubic}}

        QGlib.QGTumbler {
            rotation: 90;
            width: parent.height;
            height: parent.width;
            anchors.centerIn: parent;
            onCurrentIndexChanged: console.log(currentIndex);
            model: ["00", "01", "02", "03", "04", "05"];
        }
    }





}
