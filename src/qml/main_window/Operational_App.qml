import QtQuick 2.12
import "operational_app"

Item {
    anchors.fill: parent;
    visible: true;




//    Worldmap_Background {  }

    Header { id: _header; }


    Rectangle {
        width: parent.width/2;
        height: parent.height
    }

//    Rectangle {
//        id: _main;
//        width: parent.width;
//        height: parent.height - (2*(_header.height + _header.y));
//        y: (_header.height + _header.y);

////        Rectangle {
////            id: rect
////            width: parent.width - 15;
////            height: parent.height - 5;
////            radius: 5;
////            anchors.centerIn: parent;
////            gradient: Gradient{
////                GradientStop{position: 0; color: "#99222126";}
////                GradientStop{position: 1; color: "#99151517";}
////            }
////        }

////    }


    Map_container {  }
    Main_spectrum {  }

    Row {
        width: parent.width/2;
        height: (parent.height - (_header.height+_header.y))/2;
        y: (parent.height - (_header.height + _header.y))/2 + (_header.height+ _header.y);
        Jammer_container {  }

        GNSS_container {  }
    }

    Row {
        width: parent.width;
        height: Constants.header_status_height;
        y: parent.height - height;
        TimeLine {  }
        Network_status { }
    }

}

