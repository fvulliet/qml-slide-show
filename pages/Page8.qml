pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import ThemesModule
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Anchors"
    pageNb: 8
    code:
    `Rectangle {
        id: container

        Rectangle {
            id: red
            anchors.right: container.right
            anchors.bottom: container.bottom
        }

        Rectangle {
            id: white
            anchors.right: red.left
            anchors.verticalCenter: red.verticalCenter
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: Themes.style_brightColor

        Rectangle {
            id: red
            color: "salmon"
            width: parent.width/3
            height: parent.height/3
            anchors.right: container.right
            anchors.bottom: container.bottom

            Text {
                visible: root.viewport !== 0
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/6
                    bold: true
                }
                color: Themes.style_darkestColor
                text: "bottom\nright"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: blue
            color: "lightblue"
            width: parent.width/3
            height: parent.height/3
            anchors.centerIn: parent

            Text {
                visible: root.viewport !== 0
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/6
                    bold: true
                }
                color: Themes.style_darkestColor
                text: "centered"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: white
            color: "white"
            width: red.width/1.5
            height: red.height/1.5
            anchors {
                right: red.left
                verticalCenter: red.verticalCenter
            }

            Text {
                visible: root.viewport !== 0
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/6
                    bold: true
                }
                color: Themes.style_darkestColor
                text: "stuck to\nred"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
