import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Math"
    code: ""
    dynamicComp: Rectangle {
        id: container
        color: "#D0C9C0"

        Rectangle {
            color: "#2CDE85"
            height: Math.max(200, container.height/2) // mini 200
            width: Math.min(200, container.width/2) // maxi 200
        }
    }
}
