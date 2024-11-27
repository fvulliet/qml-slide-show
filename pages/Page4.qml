import QtQuick
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Declarative syntax"
    code: "Rectangle {\n\tcolor: \"lightgray\"\n\tRectangle {\n\t\tcolor: \"#2CDE85\"\n\t\twidth: parent.width/4\n\t\theight: parent.height/2\n\t}\n}"
    dynamicComp: Rectangle {
        color: "lightgray"

        Rectangle {
            color: "#2CDE85"
            width: parent.width/4
            height: parent.height/2
        }
    }
}
