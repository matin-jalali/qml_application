import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

TextField {
    id: control;

    /*intialize*/
    width: 100;
    height: 30;

    /*qmlproperty: set color for label.*/
    color: "white";

    /*qmlproperty: set color for place holder.*/
    placeholderText: "";
    selectByMouse: true;

    /*qmlproperty: set color for background layer effect.*/
    property color layer_effect_color: "#9994afb8";

    property color enabled_background_color: "#282828";
    property color disabled_background_color: "#101010";

    background: background;
    Rectangle {
        id: background;

        implicitWidth: parent.width;
        implicitHeight: parent.height;

        color: control.enabled ?
                   control.enabled_background_color :
                   control.disabled_background_color;

        radius: 4;
        layer.enabled: control.enabled ? control.focus : false;
        layer.effect: Glow {
            spread: .4;
            radius: 5;
            color: control.layer_effect_color;
            transparentBorder: true;
        }
    }
}
