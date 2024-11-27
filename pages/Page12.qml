import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Screen and DPI* considerations"
    code: ""
    dynamicComp: Rectangle {
        id: container
        color: "lightgray"

        Rectangle {
            width: Screen.width * 0.8
            height: Screen.height * 0.5
        }
    }
}
