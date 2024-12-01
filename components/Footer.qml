import QtQuick
import ThemesModule

Item {
    id: root

    property alias timeTxt: time.text

    Text {
        id: time
        color: Themes.style_themeColor
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
