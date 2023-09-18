import QtQuick 2.12
import QtQuick.Controls 2.12
import "../../constants"

Column {
    id: welcome_pack
    anchors.horizontalCenter: parent.horizontalCenter;
    spacing: 20;
    y: parent.height / 4.5;
    Behavior on y {NumberAnimation{duration: 250; easing.type: Easing.Linear;}}
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
