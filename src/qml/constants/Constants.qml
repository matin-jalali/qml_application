pragma Singleton
import QtQml 2.12
import QtQuick 2.12
import QtQuick.Window 2.12

QtObject {
    //! qmlproperty: qml project's name.
    readonly property string project_name: "qml app";

    //qmlproperty: screen width/hieght.
    readonly property int width: Screen.width;
    readonly property int height: Screen.height;
    readonly property int header_status_height: Screen.height/30.;

    //!qmlproperty: some background's color.
    readonly property color background_color: "#202025";
    readonly property color status_background_color: "#151515";
    readonly property color worldmap_color: "#99323232";

    //!qmlproperty: some fonts.
//    readonly property FontLoader futuristic_kusanagi: FontLoader {source: "../assets/fonts/Kusanagi.otf"; }
//    readonly property FontLoader san_francisco: FontLoader {source: "../assets/fonts/san_francisco.otf";}
//    readonly property FontLoader seven_segment: FontLoader {source: "../assets/fonts/Seven Segment.ttf";}
//    readonly property FontLoader serif_pro: FontLoader {source: "../assets/fonts/sf_pro.ttf";}
}

