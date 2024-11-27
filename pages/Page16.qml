import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "xxx"
    code: ""
    dynamicComp: Rectangle {
        id: container
        color: "lightgray"
    }
}
