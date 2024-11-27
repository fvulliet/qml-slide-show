pragma ComponentBehavior: Bound
import QtQuick

Page {
    id: root

    property alias title: mainTitleText.text
    property alias subTitle: subTitleText.text
    property var images: []

    Column {
        anchors.fill: parent

        Column {
            width: parent.width
            height: parent.height / 2
            spacing: 24

            Item {
                id: mainTitle
                width: parent.width
                height: (parent.height - parent.spacing) / 2

                Text {
                    id: mainTitleText
                    font {
                        family: "Helvetica"
                        pixelSize: root.isSmallScreen ? 32 : 64
                        bold: true
                    }
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    wrapMode: Text.WordWrap
                }
            }
            Item {
                id: subTitle
                width: parent.width
                height: (parent.height - parent.spacing) / 2

                Text {
                    id: subTitleText
                    font {
                        family: "Helvetica"
                        pixelSize: mainTitleText.font.pixelSize/2
                        italic: true
                    }
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                }
            }
        }
        Item {
            width: parent.width
            height: parent.height / 2

            ListView {
                id: listView
                anchors {
                    fill: parent
                    margins: 10
                }
                model: root.images
                orientation: root.isSmallScreen ? Qt.Vertical : Qt.Horizontal
                layoutDirection: Qt.LeftToRight
                spacing: root.isSmallScreen ? 24 : 48
                delegate: Item {
                    id: delItem
                    required property string modelData
                    property double _ratio: 1
                    height: root.isSmallScreen ? (listView.height - ((root.images.length-1) * listView.spacing)) / root.images.length :
                                                 listView.height * _ratio
                    width: root.isSmallScreen ? listView.width * _ratio :
                                                (listView.width - ((root.images.length-1) * listView.spacing)) / root.images.length

                    Image {
                        id: delImage
                        property double _ratio: 1

                        height: parent.height * _ratio
                        width: parent.width * _ratio
                        source: delItem.modelData
                        fillMode: Image.PreserveAspectFit
                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter

                        SequentialAnimation {
                            id: myAnim1

                            running: !root.isSmallScreen
                            loops: Animation.Infinite
                            NumberAnimation {
                                target: delImage
                                property: "_ratio"
                                from: 1; to: 0.9
                                easing.type: Easing.InQuad; duration: 500
                            }
                            NumberAnimation {
                                target: delImage
                                property: "_ratio"
                                from: 0.9; to: 1
                                easing.type: Easing.OutQuad; duration: 1000
                            }
                        }

                        SequentialAnimation {
                            id: myAnim2

                            running: root.isSmallScreen
                            loops: Animation.Infinite
                            NumberAnimation {
                                target: delImage
                                property: "opacity"
                                from: 1; to: 0.5
                                easing.type: Easing.InQuad; duration: 250
                            }
                            NumberAnimation {
                                target: delImage
                                property: "opacity"
                                from: 0.5; to: 1
                                easing.type: Easing.OutQuad; duration: 500
                            }
                        }
                    }
                }
            }
        }
    }
}
