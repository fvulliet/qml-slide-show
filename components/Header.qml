import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property color color: "black"

    signal bigger()
    signal smaller()

    RowLayout {
        height: parent.height - 24
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 2*height

            Text {
                anchors.fill: parent
                text: "\uf390"
                font.family: webFont.name
                font.pixelSize: height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#2CDE85"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: root.bigger()
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 2*height

            Text {
                anchors.fill: parent
                text: "\uf3cf"
                font.family: webFont.name
                font.pixelSize: height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#2CDE85"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: root.smaller()
            }
        }
    }
}
