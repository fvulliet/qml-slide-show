import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Anchors"
    code: "Rectangle {\n\tcolor: \"lightgray\"\n\tGridLayout {\n\t\tcolumns: 3\n\t\tRectangle { color: \"blue\"); }\n\t\tRectangle { color: \"white\"; }\n\t\tRectangle { color: Qt.darker(\"red\"); }\n\t}}"
    dynamicComp: Rectangle {
        id: container
        color: "lightgray"

        Rectangle {
            color: "#2CDE85"
            width: 50
            height: width
            anchors.left: container.left
            anchors.right: container.right
        }
    }
}
