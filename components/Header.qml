pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property color color: "black"
    property int currentFormat: Header.Formats.DESKTOP

    enum Formats { SMARTPHONE, TABLET, DESKTOP }

    signal desktop()
    signal tablet()
    signal smartphone()

    component Display: Item {
        id: displayCmp
        property string icon
        property int format

        signal clicked

        Text {
            anchors.fill: parent
            text: displayCmp.icon
            font.family: webFont.name
            font.pixelSize: height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: root.currentFormat === displayCmp.format ? "white" : "#2CDE85"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.currentFormat = displayCmp.format;
                displayCmp.clicked();
            }
        }
    }

    RowLayout {
        height: parent.height - 24
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        Display {
            Layout.fillHeight: true
            Layout.preferredWidth: 2*height
            icon: "\uf108"
            format: Header.Formats.DESKTOP
            onClicked:
            {
                root.currentFormat = Header.Formats.DESKTOP;
                root.desktop();
            }
        }

        Display {
            Layout.fillHeight: true
            Layout.preferredWidth: 2*height
            icon: "\uf3fa"
            format: Header.Formats.TABLET
            onClicked:
            {
                root.currentFormat = Header.Formats.TABLET;
                root.tablet();
            }
        }

        Display {
            Layout.fillHeight: true
            Layout.preferredWidth: 2*height
            icon: "\uf3cf"
            format: Header.Formats.SMARTPHONE
            onClicked:
            {
                root.currentFormat = Header.Formats.SMARTPHONE;
                root.smartphone();
            }
        }
    }
}
