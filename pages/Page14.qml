import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "UI-logic"
    pageNb: 14
    code:
    `Rectangle {
        id: gray

        Rectangle {
            color: "green"
            height: Math.max(gray.height/2, 200) // mini 200
            width: gray.width/2 > 300 ? 300 : gray.width/2 // maxi 300
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: "#D0C9C0"

        Rectangle {
            color: "#2CDE85"
            height: Math.max(container.height/2, 200) // mini 200
            width: container.width/2 > 300 ? 300 : container.width/2 // maxi 300

            Column {
                anchors.fill: parent
                visible: !root.isSmallScreen
                Text {
                    width: parent.width
                    height: parent.height/2
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: 24
                        bold: true
                    }
                    color: "#2E2E2E"
                    text: "min. height=200"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    width: parent.width
                    height: parent.height/2
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: 24
                        bold: true
                    }
                    color: "#2E2E2E"
                    text: "max.width=300"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
