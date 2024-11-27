pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Flickable"
    code: ""
    dynamicComp: Rectangle {
        id: container
        color: "#D0C9C0"

        ListView {
            id: list
            anchors {
                fill: parent
                margins: 30
            }
            model: ["you", "should", "now", "read", "the", "code", "on", "the", "left", "side"]
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
                    font.pixelSize: height*0.9
                    font.bold: true
                    color: "white"
                }
            }
        }
    }
}
