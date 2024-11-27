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
            width: parent.width/4
            height: parent.height/4
            anchors.right: container.right
            anchors.bottom: container.bottom
        }

        Rectangle {
            color: Qt.lighter("#2CDE85")
            width: parent.width/4
            height: parent.height/4
            anchors.centerIn: parent
        }
    }
}
