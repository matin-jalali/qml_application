import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Tumbler {
    id: root;
    width: 130;
    height: 660;
    visibleItemCount: 5
    wrap : false;

    delegate: Item {
        width: root.width;
        height: width;
        opacity: 1.0 - Math.abs(Tumbler.displacement) / root.visibleItemCount;
        scale: opacity;
        rotation: -90;
        Column {
            anchors.fill: parent;
            Rectangle {anchors.horizontalCenter: parent.horizontalCenter;  width: parent.width-20; height: width; radius: width; color: "gray"; }
            Label { text: modelData;  color: "white"; anchors.horizontalCenter: parent.horizontalCenter; }
        }



    }/*delegate*/

}
