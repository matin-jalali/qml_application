import QtQuick 2.12
import QtGraphicalEffects 1.0
import "../../qglib/content" as QGlib

Item {
    width: parent.width/2;
    height: parent.height;

    RectangularGlow {
        id: effect
        anchors.fill: rect
        glowRadius: 1
        spread: 0.2
        color: "#99888888"
        cornerRadius: rect.radius + glowRadius
    }

    Rectangle {
        id: rect
        width: parent.width - 5;
        height: parent.height - 5;
        radius: 5;
        anchors.centerIn: parent;
        gradient: Gradient{
            GradientStop{position: 0; color: "#222126"}
            GradientStop{position: 1; color: "#151517"}
        }


        Row {
            anchors.fill: parent;
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 5;
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter;
                height: parent.height/1.5;
                width: height;
                radius: height;
                color: "transparent";
                border.color: "white";
                QGlib.QGColorize {
                    anchors.centerIn: parent;
                    width: parent.width/1.2;
                    height: parent.height/1.2;
                    source: "../assets/images/play.svg";
                    color: "white";
                }
            }/*play*/
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter;
                height: parent.height/1.5;
                width: height;
                radius: height;
                color: "transparent";
                border.color: "white";
                QGlib.QGColorize {
                    anchors.centerIn: parent;
                    width: parent.width/1.4;
                    height: parent.height/1.4;
                    source: "../assets/images/log.svg";
                    color: "white";
                }
            }/*log*/
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter;
                height: parent.height/1.5;
                width: height;
                radius: height;
                color: "transparent";
                border.color: "white";
                QGlib.QGColorize {
                    anchors.centerIn: parent;
                    width: parent.width/1.4;
                    height: parent.height/1.4;
                    source: "../assets/images/time.svg";
                    color: "white";
                }
            }/*time*/
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter;
                height: parent.height/1.5;
                width: height;
                radius: height;
                color: "transparent";
                border.color: "white";
                QGlib.QGColorize {
                    anchors.centerIn: parent;
                    width: parent.width/1.4;
                    height: parent.height/1.4;
                    source: "../assets/images/download.svg";
                    color: "white";
                }
            }/*log*/


        }







    }
}
