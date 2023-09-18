import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Tumbler {
    id: root;
    width: 130;
    height: 660;
    visibleItemCount: 5
    wrap : false;
    signal clicked();

    delegate: Item {
        width: root.width;
        height: width;
        opacity: 1.0 - Math.abs(Tumbler.displacement) / root.visibleItemCount;
        scale: opacity;
        rotation: -90;
        Column {
            width: parent.width; height: parent.height; y: 5;
            spacing: 5

            Rectangle {
                id: x
                property Gradient borderGradient: borderGradient
                anchors.horizontalCenter: parent.horizontalCenter;  width: parent.width-30; height: width; radius: width; color: "transparent";

                MouseArea {
                    anchors.fill: parent;
                    onClicked: root.clicked();
                }

                Loader {
                    id: loader
                    width: parent.width;
                    height: parent.height;
                    anchors.centerIn: parent
                    active: borderGradient
                    sourceComponent: border
                }

                Gradient {
                    id: borderGradient;
                    GradientStop {
                        position: 0.0;
                        color: index === root.currentIndex  ? "#99f5f5f5" : "transparent";
                    }
                    GradientStop {
                        position: 0.5;
                        color: index === root.currentIndex  ? "#99f2f2f4" : "transparent"
                    }
                    GradientStop {
                        position: 1.0;
                        color: index === root.currentIndex  ? "#99baddf6" : "transparent";
                    }
                }

                Component {
                    id: border
                    Item {
                        ConicalGradient {
                            id: borderFill
                            anchors.fill: parent
                            gradient: borderGradient
                            visible: false
                        }

                        Rectangle {
                            id: mask
                            radius: root.width-20;
                            border.width: 1;
                            anchors.fill: parent
                            color: 'transparent'
                            visible: false// otherwise a thin border might be seen.
                        }

                        OpacityMask {
                            id: opM
                            anchors.fill: parent
                            source: borderFill
                            maskSource: mask
                        }
                    }
                }

                Label { id: add_new; visible: index === (root.model.length-1); anchors.centerIn: parent; font.pixelSize: 25; font.bold: true; color: "white"; text: '+'; }

                Image {
                    id: image;
                    visible: index !== (root.model.length-1);
                    width: parent.width/1.5;
                    height: parent.height/1.5;
                    anchors.centerIn: parent;
                    property color color: "#9994afb8";
                    source: "../../assets/user.png";
                    Colorize {
                        anchors.fill: image;
                        source: image;
                        hue: image.color.hslHue;
                        saturation: image.color.hslSaturation;
                        lightness: image.color.hslLightness;
                        anchors.centerIn: parent;
                    }
                }



            }




            Label { text: modelData;  color: "white"; anchors.horizontalCenter: parent.horizontalCenter; }
        }
    }/*delegate*/

}
