pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Flickable"
    pageNb: 10
    code:
    `ListView {
        id: list
        delegate: Rectangle {
            width: list.width
            height: 100

            Text {
                anchors.fill: parent
                text: modelData
                color: "white"
            }
        }
        ScrollBar.vertical: ScrollBar {
            visible: list.contentHeight > list.height
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: "#D0C9C0"

        ListView {
            id: list
            anchors {
                fill: parent
                margins: 30
            }
            model: ["try", "to", "understand", "the", "code", "on", "the", "left"]
            spacing: 5
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            delegate: Rectangle {
                id: del
                required property string modelData
                width: list.width
                height: 100
                color: "#2CDE85"

                Text {
                    anchors.fill: parent
                    text: del.modelData
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: root.isSmallScreen ? 16 : height*3/4
                    font.bold: true
                    color: "white"
                }
            }
            ScrollBar.vertical: ScrollBar {
                visible: list.contentHeight > list.height
                parent: list.parent
                anchors {
                    top: list.top
                    right: list.right
                    bottom: list.bottom
                }
            }
        }
    }
}
