import QtQuick

Rectangle {
    id: root

    property string pageNb
    property bool isSmallScreen

    radius: 10
    color: "white"

    Text {
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
        text: root.pageNb
        font.pixelSize: root.isSmallScreen ? 24 : 48
    }
}
