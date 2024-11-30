pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Dynamic content management"
    pageNb: 16
    code:
    `Rectangle {
        id: container
        color: "#D0C9C0"

        Loader {
            anchors.fill: parent
            sourceComponent: container.width < 300 ? green : image
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: "#D0C9C0"

        Loader {
            anchors.fill: parent
            sourceComponent: container.width < 300 ? greenRect: imageComp
        }
    }

    Component {
        id: greenRect

        Rectangle {
            color: "#2CDE85"
        }
    }

    Component {
        id: imageComp

        Image {
            anchors.fill: parent
            source: "qrc:/images/marsipanpng.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}
