import QtQuick 2.12
import QtQuick.Controls 2.12
import "../../constants"
import "../../qglib/content" as QGlib
import QtGraphicalEffects 1.0

Item {
    height: parent.height - Constants.header_status_height;
    width: parent.width/2;

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
        height: parent.height - 15;
        radius: 5;
        anchors.centerIn: parent;
        gradient: Gradient{
            GradientStop{position: 0; color: "#222126"}
            GradientStop{position: 1; color: "#151517"}
        }



        Row {
            id: title;
            anchors.horizontalCenter: parent.horizontalCenter;
            y: 3;
            spacing: 3;
            // GNSS Jammer
            Label { anchors.verticalCenter: parent.verticalCenter; text: "Link Jammer"; color: "#777777"; font.bold: true; font.italic: true; }
            QGlib.QGColorize { width: 15;height: width; source: "../assets/images/jammer_icon.svg"; color: "#777777"; }
        }

        Rectangle {
            id: control;
            width: title.width;
            height: 1.;
            anchors.top: title.bottom
            anchors.horizontalCenter: parent.horizontalCenter;

            gradient: Gradient {
                orientation: Gradient.Horizontal;
                GradientStop{ position: 0.; color: Constants.background_color; }
                GradientStop{ position: .5; color: "#777777"; }
                GradientStop{ position: 1.; color: Constants.background_color; }
            }
        }/*control*/


        /////////////////////////


        Column {
            anchors.centerIn: parent;
            spacing: 5;
            Row {
                spacing: 5;

                QGlib.QGColorize {
                    width: rect.width/4.;
                    height: 50;
                    source: "../assets/images/antena.png";
                    rotation: -45
                    color: "#454545";
                }
                QGlib.QGColorize {
                    width: rect.width/4.;
                    height: 50;
                    source: "../assets/images/antena.png";
                    rotation: 0;
                    color: "#454545";
                }
                QGlib.QGColorize {
                    width: rect.width/4.;
                    height: 50;
                    source: "../assets/images/antena.png";
                    rotation: 45
                    color: "#454545";
                }
            }/*row*/


//            QGlib.QGCombobox {
//                width: parent.width;
//                height: 25;
//                list_height: model.length * 25
//                model: ["Tone",
//                        "Spot Tone",
//                        "Barrage",
//                        "Sweep Spot",
//                        "Sweep Barrage Spot"]
//            }



        }/*column*/






        ////////////////////////////////


    }/*rect*/


}
