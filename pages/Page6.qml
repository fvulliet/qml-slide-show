import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Layouts"
    code: "Rectangle {\n\tcolor: \"lightgray\"\n\RowLayout {\n\t\tRectangle { color: \"blue\"); }\n\t\tRectangle { color: \"white\"; }\n\t\tRectangle { color: \"red\"; }\n\t}}"
    dynamicComp: Rectangle {
        id: ctnr
        color: "lightgray"

        RowLayout {
            height: ctnr.height/2
            anchors.centerIn: parent
            spacing: 0
            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: ctnr.width/3
                color: "blue"
            }
            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: ctnr.width/3
                color: "white"
            }
            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: ctnr.width/3
                color: "red"
            }
        }
    }
}
