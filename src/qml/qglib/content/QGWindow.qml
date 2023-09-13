import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window;
    visible: true;
    width: 1000;
    Behavior on width { NumberAnimation{duration: 500;} }
    height: 600;
    Behavior on height { NumberAnimation{duration: 500;} }
    minimumWidth: 1000;
    minimumHeight: 600;
    title: qsTr("Title");
    color: "#99000000";

    /*some flags should set for window manager*/
    flags: Qt.Window                        |
           Qt.FramelessWindowHint           |
           Qt.WindowSystemMenuHint          |
           Qt.WindowMinMaxButtonsHint       |
           Qt.WindowCloseButtonHint         |
           Qt.MacWindowToolBarButtonHint    |
           Qt.BypassGraphicsProxyWidget     |
           Qt.CustomizeWindowHint           ;

    property double header_height: Screen.height/30.; /*~35.*/
    property Item contentItem: null;
    property Item footer: null;
    property color title_color: "#94afb8";
    property font title_font;
    property bool is_header_visible: true;
    signal exited();

    /*Top module*/
    MouseArea {
        id: topArea;
        height: 5;
        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.right;
        }
        cursorShape: Qt.SizeVerCursor;
        onPressed: page.previousY = mouseY;
        onMouseYChanged: {
            var dy = mouseY - page.previousY;
            if(window.height-dy >= window.minimumHeight) {
                window.setHeight(window.height-dy);
                window.setY(window.y+dy);
            }
        }
    }/*topArea*/
    /*Bottom module*/
    MouseArea {
        id: bottomArea;
        height: 5;
        anchors {
            bottom: parent.bottom;
            left: parent.left;
            right: parent.right;
        }
        cursorShape: Qt.SizeVerCursor;
        onPressed: page.previousY = mouseY;
        onMouseYChanged: {
            var dy = mouseY - page.previousY;
            if(window.height+dy >= window.minimumHeight)
                window.setHeight(window.height+dy);
        }
    }/*bottomArea*/
    /*Left module*/
    MouseArea {
        id: leftArea;
        width: 5;
        anchors {
            top: topArea.bottom;
            bottom: bottomArea.top;
            left: parent.left;
        }
        cursorShape: Qt.SizeHorCursor;
        onPressed: page.previousX = mouseX;
        onMouseYChanged: {
            var dx = mouseX - page.previousX;
            if(window.width-dx >= window.minimumWidth) {
                window.setX(window.x + dx);
                window.setWidth(window.width - dx);
            }
        }
    }/*leftArea*/
    /*Right module*/
    MouseArea {
        id: rightArea;
        width: 5;
        anchors {
            top: topArea.bottom;
            bottom: bottomArea.top;
            right: parent.right;
        }
        cursorShape: Qt.SizeHorCursor;
        onPressed: page.previousX = mouseX;
        onMouseXChanged: {
            var dx = mouseX - page.previousX;
            if(window.width+dx >= window.minimumWidth)
                window.setWidth(window.width + dx);
        }
    }/*rightArea*/

    /*!JavaFunc: toggle function check for window visiblity
      ,then change the properties. DONT USE VISIBLITY SUCH AS FULLSCREEN,...*/
    function toggle() {
        if(window.visibility===Window.Maximized)
            showNormal();
        else
            showMaximized();
    }

    Page {
        id: page;
        anchors.fill: parent;
        anchors.margins: window.visibility===Window.Maximized ? 0 : 5;

        property bool pres;
        property double previousX;
        property double previousY;

        header: Item {
            width: parent.width;
            height: window.header_height;

            MouseArea {
                anchors.fill: parent;
                onDoubleClicked: toggle();
                onPressed: {
                    page.pres=true;
                    if(window.visibility===Window.Maximized && window.y<0.0001)
                        showNormal();

                    page.previousX = mouseX;
                    page.previousY = mouseY;
                }/*onPressed: */
                onReleased: {
                    page.pres=false;
                    if(window.visibility!==Window.Maximized && window.y<0.0001)
                        showMaximized();
                }/*onReleased: */
                onMouseXChanged: {
                    if(page.pres) {
                        var dx = mouseX - page.previousX;
                        window.setX(window.x + dx);
                    }
                }/*onMouseXChanged:*/
                onMouseYChanged: {
                    if(page.pres) {
                        var dy = mouseY - page.previousY;
                        window.setY(window.y + dy);
                    }
                }/*onMouseYChanged:*/
            }/*header-mousearea*/

            /*Title*/
            Label {
                text: window.title;
                color: window.title_color;
                anchors.right: parent.right;
                anchors.rightMargin: 5;
                anchors.verticalCenter: parent.verticalCenter;
                minimumPixelSize: 1;
                visible: window.is_header_visible;
                font {
                    pixelSize: Qt.application.font.pixelSize*1.3;
                    bold: true;
                    italic: true;
                    family: window.title_font;
                }
            }/*title*/

            Row {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                spacing: 5;
                visible: window.is_header_visible;

                Repeater {
                    model: ["#eb655e", "#fab654", "#5dcf4b"];
                    delegate: Rectangle {
                        width: 15;
                        height: width;
                        radius: width;
                        color: modelData;
                        MouseArea {
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                            onClicked: {
                                switch(index) {
                                case 0: window.exited(); break;
                                case 1: toggle(); break;
                                case 2: if(window.visibility===Window.Minimized){
                                        window.showNormal();
                                    }else{
                                        window.showMinimized();
                                    };
                                    break;
                                default:break;
                                }/*end switch*/
                            }
                        }/*mousearea*/
                    }/*rect*/
                }/*rpt*/
            }/*window facilities...*/


        }/*header*/

        contentItem: window.contentItem;
        footer: window.footer;
    }/*page*/
}
