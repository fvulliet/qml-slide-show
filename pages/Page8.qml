import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Anchors"
    code: "Rectangle {\n\tcolor: \"#D0C9C0\"\n\tGridLayout {\n\t\tcolumns: 3\n\t\tRectangle { color: \"blue\"); }\n\t\tRectangle { color: \"white\"; }\n\t\tRectangle { color: Qt.darker(\"red\"); }\n\t}}"
    dynamicComp: Rectangle {
        id: container
        color: "#D0C9C0"

        Rectangle {
            color: "#2CDE85"
            width: parent.width/3
            height: parent.height/3
            anchors.right: container.right
            anchors.bottom: container.bottom

            Text {
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/3
                    bold: true
                }
                color: "#2E2E2E"
                text: "bottom\nright"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            color: Qt.lighter("#2CDE85")
            width: parent.width/3
            height: parent.height/3
            anchors.centerIn: parent

            Text {
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/3
                    bold: true
                }
                color: "#2E2E2E"
                text: "centered"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
