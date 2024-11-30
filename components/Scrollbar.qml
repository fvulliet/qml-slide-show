import QtQuick

Rectangle {
    id: root

    // public properties
    property bool withLift: true
    property Flickable flick
    property int defaultWidth: 4
    property int margin: 1

    // Rectangle's properties
    anchors {
        left: flick.right
        leftMargin: margin
    }
    y: flick.visibleArea.yPosition * flick.height + flick.y
    width: visible ? defaultWidth : 0
    height: flick.visibleArea.heightRatio * flick.height
    color: "red"
    visible: flick.visibleArea.heightRatio < 0.9999

    // inner components
    Item {
        id: lift

        property alias icon: arrowIcon.text

        width: 30; height: width
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.left
        }
        opacity: 0
        visible: root.withLift && opacity > 0

        states: [
            State {
                name: "TOP"
                when: root.flick.contentY < 1

                PropertyChanges {
                    target: lift; icon: "T"
                    opacity: 1
                }
            },
            State {
                name: "BOTTOM"
                when: root.flick.contentY >= (root.flick.contentHeight - root.flick.height - 1)

                PropertyChanges {
                    target: lift; icon: "B"
                    opacity: 1
                }
            }
        ]
        transitions: Transition {
            NumberAnimation {
                property: "opacity"
            }
        }

        Text {
            id: arrowIcon

            color: "blue"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (lift.state === "BOTTOM")
                    root.flick.contentY = 0
                else if (lift.state === "TOP") {
                    root.flick.contentY = root.flick.contentHeight - root.flick.height
                    root.flick.returnToBounds()
                }
            }
        }
    }
}
