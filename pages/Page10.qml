import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Flickable"
    code: ""
    dynamicComp: Rectangle {
        id: container
        color: "lightgray"

        Flickable {
        }
    }
}
