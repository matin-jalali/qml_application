import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import "../qglib/content" as QGlib
import "../constants"
import "menu"
import "../assets/"
Rectangle {
    id: _app;
    anchors.fill: parent;
    color: "#202020";


    /////////////////////
    QGlib.QGParticle {  width: parent.width/3; height: parent.height;
        anchors.centerIn: parent; rotation: 90; z: 1; }






    /////////////
    QGlib.QGColorize {
        id: _menu_background;
        anchors.fill: parent;
        source: "../assets/menu_background.jpg";
        color: "#202020";
        is_mouse_enable: false;
    }
    FastBlur {
        anchors.fill: _menu_background;
        source: _menu_background;
        radius: 120;
    }

    Column {
        id: welcome_pack
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

    Column {
        id: user;
        anchors.centerIn: parent;
        spacing: 15;
        z: 2;

        AnimatedImage {
            id: image
            width: 100;
            height: width;
            speed: 2

            NumberAnimation {
                id: scale_animation
                target: image;
                property: "scale"
                duration: 250
                from: 1; to: 5;
                easing.type: Easing.InOutQuad
                onFinished: {
                    image.playing = false;
                    welcome_pack.visible = false;
                    user.visible  = false;
                    users_container.visible = false;
                }
            }
            anchors.horizontalCenter: parent.horizontalCenter;
            source: "../../assets/hello_world.gif"
            property bool is_valid_password: false;
            onCurrentFrameChanged: {
                if(is_valid_password && currentFrame === 190) {
                    scale_animation.start();
                }

                if(!is_valid_password && currentFrame > 90 )
                    currentFrame = 0;
            }
            property bool rounded: true;
            property bool adapt: true;
            property color color: "#99555555";
            Colorize {
                anchors.fill: image;
                source: image;
                hue: image.color.hslHue;
                saturation: image.color.hslSaturation;
                lightness: image.color.hslLightness;
                anchors.centerIn: parent;
            }
            layer.enabled: rounded;
            layer.effect: ShaderEffect {
                property real adjustX: image.adapt ? Math.max(width / height, 1) : 1
                property real adjustY: image.adapt ? Math.max(1 / (width / height), 1) : 1

                fragmentShader: "
                            #ifdef GL_ES
                                precision lowp float;
                            #endif // GL_ES
                            varying highp vec2 qt_TexCoord0;
                            uniform highp float qt_Opacity;
                            uniform lowp sampler2D source;
                            uniform lowp float adjustX;
                            uniform lowp float adjustY;

                            void main(void) {
                                lowp float x, y;
                                x = (qt_TexCoord0.x - 0.5) * adjustX;
                                y = (qt_TexCoord0.y - 0.5) * adjustY;
                                float delta = adjustX != 1.0 ? fwidth(y) / 2.0 : fwidth(x) / 2.0;
                                gl_FragColor = texture2D(source, qt_TexCoord0).rgba
                                    * step(x * x + y * y, 0.25)
                                    * smoothstep((x * x + y * y) , 0.25 + delta, 0.25)
                                    * qt_Opacity;
                            }"
            }
        }/*gif*/

        QGlib.QGTextField {
            width: parent.width;
            height: 30;
            placeholderText: "Password...";
            enabled_background_color: "#454545";
            layer_effect_color: text === '1' ? "#94afb8" : "red";
            onTextChanged: if(text === '1') image.is_valid_password = true
        }
    }

    Item {
        z: 2;
        id: users_container
        anchors.horizontalCenter: parent.horizontalCenter;
        y: parent.height - (parent.height / 3.5);
        width: 660; height: 130
        clip: true;
        QGlib.QGTumbler {
            rotation: 90;
            width: parent.height;
            height: parent.width;
            anchors.centerIn: parent;
            model: ["Matin", "Blue Man", "Asd", "Ers", "John", "Add New"];
        }
    }


    ///////////////////////////////////////////////////////////////////


    Column {
        id: menu
        width: parent.width/2;
        x: parent.width/5;
        y: parent.height/4;
        spacing: 15;
        z: 3
        Rectangle {
            id: menu_titles;
            width: parent.width;
            height: 50;
            visible: !welcome_pack.visible;
            opacity: !welcome_pack.visible;
            Behavior on opacity {NumberAnimation{duration: 500; easing.type: Easing.OutQuad;}}
            color: "transparent";

            Rectangle {
                id: title_cursor;
                anchors.verticalCenter: parent.verticalCenter;
                height: parent.height;
                width: 87;
                x: -5;
                radius: 10;
                opacity: .7;
                Behavior on x { NumberAnimation{duration: 500; easing.type: Easing.OutQuad;} }
                color: "#99888888";
            }


            Row {
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 15;
                Repeater {
                    model: ["Application", "Test", "Store", "Info"];

                    Label {
                        id: title_label
                        text: modelData; color: "white"; font.pixelSize: 15;
                        MouseArea {
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                            onClicked: {
                                title_cursor.x = title_label.x - 5;
                                title_cursor.width = title_label.width + 10;
                                title_cursor.height = title_label.height + 15;
                                console.log(title_cursor.height);
                            }
                        }
                    }/*title_label*/
                }/*Rpt*/
            }/*row*/
        }/*menu_titles*/


        Rectangle {
            id: item_titles;
            width: parent.width;
            height: 120;
            visible: !welcome_pack.visible;
            opacity: !welcome_pack.visible;
            Behavior on opacity {NumberAnimation{duration: 500; easing.type: Easing.OutQuad;}}
            color: "transparent";

            ///////////////

            Rectangle {
                id: item_cursor;
                width: 110;
                height: 125;
                color: "99888888";
                opacity: .7;
                x: -5;
                Behavior on x { NumberAnimation{duration: 500; easing.type: Easing.OutQuad;} }

            }


            Row {
                anchors.fill: parent;
                spacing: 15;
                QGlib.QGRoundedImage {
                    id: image_item
                    source: "../assets/menu_background.jpg";
                    radius: 10;

                    MouseArea {
                        anchors.fill: parent;
                        cursorShape: Qt.PointingHandCursor;
                        onClicked: {
                            item_cursor.x = image_item.x - 5;
//                            item_cursor.width = image_item.width + 10;
//                            item_cursor.height = image_item.height + 15;
                        }
                    }


                }
                QGlib.QGRoundedImage {
                    source: "../assets/github_wallpaper.jpg";
                    radius: 10;
                }
                QGlib.QGRoundedImage {
                    source: "../assets/software_test_walpaper.jpg";
                    radius: 10;
                }
                QGlib.QGRoundedImage {
                    source: "../assets/system_testing-wallpaper.jpg";
                    radius: 10;
                }
            }




            /////////////////

        }
        Rectangle {
            id: item_description;
            width: parent.width;
            height: 180;
            visible: !welcome_pack.visible;
            opacity: !welcome_pack.visible;
            Behavior on opacity {NumberAnimation{duration: 500; easing.type: Easing.OutQuad;}}
            color: "transparent";
        }


    }













}
