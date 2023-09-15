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
            width: parent.width; height: parent.height; y: 5;
            spacing: 5



////                AnimatedImage
////                {
////                    width: parent.width
////                    height: parent.height
////                    source: "../../assets/hello_world.gif"

//////                    anchors.left: parent.left
//////                    anchors.top: parent.top
//////                    transform: Translate {x: 17; y: 2}
////                }


            Rectangle {
                id: x
                property Gradient borderGradient: borderGradient
                anchors.horizontalCenter: parent.horizontalCenter;  width: parent.width-30; height: width; radius: width; color: "transparent";
//                gradient: Gradient {
//                    GradientStop { position: 0; color: "#99202020"; }
//                    GradientStop { position: 1; color: "#99232323"; }
//                }

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
//                                    property bool rounded: false;
//                                    property bool adapt: true;
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
//                                    layer.enabled: rounded;
//                                    layer.effect: ShaderEffect {
//                                        property real adjustX: image.adapt ? Math.max(width / height, 1) : 1
//                                        property real adjustY: image.adapt ? Math.max(1 / (width / height), 1) : 1

//                                        fragmentShader: "
//                                        #ifdef GL_ES
//                                            precision lowp float;
//                                        #endif // GL_ES
//                                        varying highp vec2 qt_TexCoord0;
//                                        uniform highp float qt_Opacity;
//                                        uniform lowp sampler2D source;
//                                        uniform lowp float adjustX;
//                                        uniform lowp float adjustY;

//                                        void main(void) {
//                                            lowp float x, y;
//                                            x = (qt_TexCoord0.x - 0.5) * adjustX;
//                                            y = (qt_TexCoord0.y - 0.5) * adjustY;
//                                            float delta = adjustX != 1.0 ? fwidth(y) / 2.0 : fwidth(x) / 2.0;
//                                            gl_FragColor = texture2D(source, qt_TexCoord0).rgba
//                                                * step(x * x + y * y, 0.25)
//                                                * smoothstep((x * x + y * y) , 0.25 + delta, 0.25)
//                                                * qt_Opacity;
//                                        }"
//                                    }
                                }



            }

            ///////////////////



            Label { text: modelData;  color: "white"; anchors.horizontalCenter: parent.horizontalCenter; }
        }
    }/*delegate*/

}
