import QtQuick 2.12
import QtLocation 5.12
import QtPositioning 5.11
import QtGraphicalEffects 1.0
import QtCharts 2.3
import "../../qglib/content" as QGlib

Item {
    height: (parent.height - 2*(_header.height+_header.y));
    width: parent.width/2;
    y: _header.height + _header.y;
    anchors.right: parent.right;


//    RectangularGlow {
//        id: effect
//        anchors.fill: rect
//        glowRadius: 1
//        spread: 0.2
//        color: "#99888888"
//        cornerRadius: rect.radius + glowRadius
//    }

    Rectangle {
        id: rect
        width: parent.width - 15;
        height: parent.height - 15;
        radius: 5;
        anchors.centerIn: parent;
        gradient: Gradient{
            GradientStop{position: 0; color: "#99222126"}
            GradientStop{position: 1; color: "#99151517"}
        }

        Plugin{
            id: mapPlugin
            name: "osm"
            PluginParameter{name: "osm.useragent"; value: "IVarejo"}
            PluginParameter{name: "osm.mapping.custom.host"; value: "https://tile.openstreetmap.org"}
            PluginParameter{name: "osm.mapping.providersrepository.disabled"; value: true}
        }

        Map {
            id: map
            width: parent.width - 15;
            height: parent.height - 15;
            plugin: mapPlugin
            anchors.centerIn: parent;
            center: QtPositioning.coordinate(35.75392060171761, 51.48247556489983);
            zoomLevel: 16.5;
            Rectangle { width: parent.width; height: 25; anchors.bottom: parent.bottom; z: 50; color: "#151517"; }


//            Item {
//                id: h
//                width: map.width/3;
//                height: width;
//                z: 2;
//                opacity: .3;
//                Behavior on opacity { NumberAnimation{duration: 150;} }
//                anchors.bottom: parent.bottom;
//                anchors.left: parent.left;

//                Column {
//                    anchors.centerIn: parent
//                    QGlib.QGColorize {
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        width: 30;
//                        height: width;
//                        rotation: -90
//                        color: "blue";
//                        source: "../assets/images/rotaryRight.png"
//                    }

//                Row {
//                    anchors.horizontalCenter: parent.horizontalCenter
////                    anchors.centerIn: parent;
//                    spacing: 25
//                QGlib.QGColorize {
//                    width: 30;
//                    height: width;
//                    rotation: 180;
//                    color: "blue";
//                    source: "../assets/images/rotaryRight.png"
//                }
//                QGlib.QGColorize {
//                    width: 30;
//                    height: width;
//                    color: "blue";
//                    source: "../assets/images/rotaryRight.png"
//                }
//                }
//                QGlib.QGColorize {
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    width: 30;
//                    height: width;
//                    rotation: 90;
//                    color: "blue";
//                    source: "../assets/images/rotaryRight.png"
//                }





//                }

////                rotaryRight.png


//                MouseArea {
//                    anchors.fill: parent;
//                    hoverEnabled: true;
//                    onHoveredChanged:  {
//                        if(containsMouse)
//                            h.opacity = 1
//                        else
//                            h.opacity = .3
//                    }
//                }
//            }


//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    var coord = map.toCoordinate(Qt.point(mouse.x,mouse.y));
////                    transMarker.coordinate = coord;
//                    console.log(coord.latitude, coord.longitude)
//                }
//            }

            ////////////////
            MapQuickItem {
                anchorPoint.x: _ppi.width/2
                anchorPoint.y: _ppi.height/2
                coordinate: QtPositioning.coordinate(35.75392060171761, 51.48247556489983)
                            zoomLevel: 17
                sourceItem: /*Item {
                    id: src
                    height: control.width
                    width: control.height
                    /////////////////////*/

                    PolarChartView {

                        id: _ppi;
                        width: height;//map.width*1.5
                        height: map.height*1.5
    //                    anchors.horizontalCenter: parent.horizontalCenter;
                        legend.visible: false
                        antialiasing: true
                        backgroundColor: "transparent"
                        anchors.rightMargin : 0;
                        anchors.leftMargin  : 0;
                        anchors.topMargin   : 0;
                        anchors.bottomMargin: 0;


                        MouseArea {
                            anchors.fill: parent;

                            onClicked: console.log("salam")
                        }

                    ////////////////////////////////
                        Rectangle{
                            id:servoAngle;
                            anchors.centerIn: parent;
                            width: _ppi.plotArea.width;
                            height: _ppi.plotArea.height;
                            radius: width;
    //                        color: "red";
                            gradient: Gradient {
                                GradientStop { position: 0.5; color: "#99282828" }
                                GradientStop { position: 1.0; color: "#99202020" }
                            }


                            ////
                            Timer{id:timer; interval: 1; repeat: true; running: true;
                                property bool saatgard: false
                                onTriggered:{
//                                    if(saatgard)
                                        handle.angle= handle.angle+1;
//                                    else
//                                        handle.angle--;
//                                    if(handle.angle===40)
//                                        saatgard=false;

//                                    if(handle.angle===-40)
//                                        saatgard=true;
                                }
                            }
                            ////

                            ConicalGradient {
                                id: handle
                                anchors.fill: parent
                                angle: 0.0
                                source: Rectangle {
                                    width: handle.width
                                    height: handle.height
                                    radius: width*0.5
                                }
                                gradient: Gradient {
                                    GradientStop { position: 0.0 ; color: "transparent"; }
                                    GradientStop { position: 0.96; color: "transparent"; }
                                    GradientStop { position: 1.0 ;  color: Qt.rgba(.439, .471, .733, 1); }
                                }
                            }/*handle*/
                        }


                        ///////////////////////////////////



    //                    Canvas{
    //                        anchors.fill: parent;
    //                        onPaint: {
    //                            var ctx = getContext('2d');
    //                            ctx.lineWidth = 1;
    //                            ctx.strokeStyle = "black"//Constants.background_color;
    //                            ctx.fillStyle = "black"//Constants.background_color;
    //                            ctx.beginPath();

    //                            /* .1 is margin */
    //                            var clipper = _ppi.mapToPosition( Qt.point(40 + .1, axisRadial.max) );
    //                            ctx.moveTo( parent.width/2, parent.height/2 );
    //                            ctx.lineTo( clipper.x, clipper.y );
    //                            ctx.lineTo( parent.width, clipper.y );
    //                            ctx.lineTo( parent.width, parent.height );

    //                            /* .1 is margin */
    //                            clipper = _ppi.mapToPosition( Qt.point(320 - .1, axisRadial.max) );
    //                            ctx.moveTo( parent.width/2, parent.height/2 );
    //                            ctx.lineTo( clipper.x, clipper.y );
    //                            ctx.lineTo( 0, clipper.y );
    //                            ctx.lineTo( 0, parent.height );

    //                            ctx.lineTo( parent.width, parent.height );

    //                            ctx.clip();
    ////                            ctx.closePath();
    ////                            ctx.stroke();
    ////                            ctx.fill();
    //                        }
    //                    }


                        ValueAxis {
                            id: axisAngular;
                            min: 0;
                            max: 360;
                            tickCount: 37;
                            gridVisible: true;
                            lineVisible: false;
                            labelsVisible: true;
                            color: Qt.rgba(.439, .471, .733, 1);
                            gridLineColor: color;
                            labelsColor: color;
                            onMaxChanged: axisAngular.max=360.0;
                            onMinChanged: axisAngular.min = 0;
                        }


                        //    AxisAngular{ id: axisAngular; }
                        ValueAxis {
                            id: axisRadial;
                            min: 0.0;
                            max: 1.5;
                            tickCount: 10;
                            gridVisible: true;
                            lineVisible: false;
                            color: Qt.rgba(.439, .471, .733, 1);
                            gridLineColor: color;
                            labelsColor: color;
                        }


                        LineSeries {
                            id: series3
                            axisAngular: axisAngular
                            axisRadial: axisRadial
                            useOpenGL: true;
                            color: "red"
                            XYPoint{ x: 0; y:.5 }
                            XYPoint{ x: 30; y:1. }
                        }






                    }

            }


            ///////////////
















        }
    }





}
