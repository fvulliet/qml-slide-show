pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
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
        color: "#D0C9C0"

        Rectangle {
            id: red
            color: "salmon"
            width: parent.width/3
            height: parent.height/3
            anchors.right: container.right
            anchors.bottom: container.bottom

            Text {
                visible: !root.isSmallScreen
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/6
                    bold: true
                }
                color: "#2E2E2E"
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
                visible: !root.isSmallScreen
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/6
                    bold: true
                }
                color: "#2E2E2E"
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
                visible: !root.isSmallScreen
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: height/6
                    bold: true
                }
                color: "#2E2E2E"
                text: "stuck to\nred"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
