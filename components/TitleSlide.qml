pragma ComponentBehavior: Bound
import QtQuick

GradientPage {
    id: root

    property alias title: mainTitleText.text
    property alias subTitle: subTitleText.text
    property alias additional: additionalText.text
    property var images: []

    Column {
        anchors {
            fill: parent
            margins: 16
        }

        Column {
            width: parent.width
            height: parent.height / 2
            spacing: 24

            Item {
                id: mainTitle
                width: parent.width
                height: root.isSmallScreen ? (parent.height - parent.spacing) / 2 :
                                             (parent.height - 2*parent.spacing) * 2/5

                Text {
                    id: mainTitleText
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: root.isSmallScreen ? 40 : 96
                        bold: true
                    }
                    color: "#2E2E2E"
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    wrapMode: Text.WordWrap
                }
            }
            Item {
                id: subTitle
                width: parent.width
                height: root.isSmallScreen ? (parent.height - parent.spacing) / 2 :
                                             (parent.height - 2*parent.spacing) * 2/5

                Text {
                    id: subTitleText
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: mainTitleText.font.pixelSize/2
                        italic: true
                    }
                    color: "#2E2E2E"
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                }
            }
            Item {
                id: aditional
                width: parent.width
                height: root.isSmallScreen ? 0 : (parent.height - 2*parent.spacing) / 5
                visible: height > 0

                Text {
                    id: additionalText
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: subTitleText.font.pixelSize
                        italic: true
                        bold: true
                    }
                    color: "#6A737B"
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
                                                 listView.height
                    width: root.isSmallScreen ? listView.width :
                                                (listView.width - ((root.images.length-1) * listView.spacing)) / root.images.length

                    Image {
                        id: delImage
                        property double _ratio: 1

                        height: parent.height * _ratio
                        width: parent.width * _ratio
                        source: delItem.modelData
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent

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
