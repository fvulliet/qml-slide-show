import QtQuick

Rectangle {
    id: root

    property int pageNb: 0
    property bool isSmallScreen

    radius: 10
    color: "#F2F2F0"

    Component.onCompleted: pageNbTxt.opacity = 1
    Text {
        id: pageNbTxt
        visible: root.pageNb > 0
        anchors {
            bottom: parent.bottom
            bottomMargin: 10
            left: parent.left
            leftMargin: 10
        }
        text: root.pageNb
        opacity: 0
        font.pixelSize: root.isSmallScreen ? 24 : 48
        Behavior on opacity { NumberAnimation { duration: 2000 } }
    }
}
