import QtQuick

Item {
    id: root

    property alias timeTxt: time.text

    Text {
        id: time
        color: "#2CDE85"
        font {
            family: "reMarkableSans-Regular"
            pixelSize: height/2
        }
        height: parent.height
        anchors {
            right: parent.right
            rightMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
    }
}
