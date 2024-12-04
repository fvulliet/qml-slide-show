pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import ThemesModule
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Dynamic content management"
    pageNb: 16
    code:
    `Rectangle {
        id: container
        Themes.style_brightColor

        Loader {
            anchors.fill: parent
            sourceComponent: container.width < 400 ? green : image
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: Themes.style_brightColor

        Loader {
            anchors.fill: parent
            sourceComponent: container.width < 400 ? greenRect: imageComp
        }

        Text {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
            font {
                family: "reMarkableSans-Regular"
                pixelSize: 24
                bold: true
            }
            color: Themes.style_darkestColor
            text: Math.round(container.width)
            verticalAlignment: Text.AlignTop
        }
    }

    Component {
        id: greenRect

        Image {
            anchors.fill: parent
            source: "qrc:/images/chameleon1.png"
            fillMode: Image.PreserveAspectFit
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
