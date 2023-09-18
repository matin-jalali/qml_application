import QtQuick 2.12
import "../../qglib/content" as QGlib

Item {
    id: users_container
    anchors.horizontalCenter: parent.horizontalCenter;
    width: 660; height: 130
    y: parent.height - (parent.height / 3.5);
    z: 2;
    clip: true;
    QGlib.QGTumbler {
        rotation: 90;
        width: parent.height;
        height: parent.width;
        anchors.centerIn: parent;
        model: ["Matin", "Add New"];
        onClicked: {
            console.log(model[currentIndex]);
            _app.state = "items";
        }
    }
}
