import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Screen and device adaptation"
    code: ""
    dynamicComp: Rectangle {
        id: container
        color: "lightgray"

        Rectangle {
            height: Screen.height/2
            width: Screen.width > 800 ? 600 : 300
        }
    }
}
