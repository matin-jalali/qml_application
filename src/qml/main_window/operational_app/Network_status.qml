import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

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
        width: parent.width - 15;
        height: parent.height - 5;
        radius: 5;
        anchors.centerIn: parent;
        gradient: Gradient{
            GradientStop{position: 0; color: "#222126"}
            GradientStop{position: 1; color: "#151517"}
        }


        Row {
            anchors.centerIn: parent;
//            spacing: 15;

        Row {
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 5;
            Label { width: 60; text: "Counter"; color: "green"; font.bold: true; }
            Label { width: 70; text: "65999"; color: "green"; font.bold: true; }
        }
        Row {
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 5;
            Label { width: 35; text: "Lost"; color: "red"; font.bold: true; }
            Label { width: 70; text: "65999"; color: "red"; font.bold: true; }
        }

        }




    }
}
