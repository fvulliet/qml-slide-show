import QtQuick
import "./components" as Components
import "./pages" as Pages

Window {
    id: root

    property bool _isDesktop: true
    property int _currentPage: 0

    height: Screen.height * 0.8
    width: Screen.width * 0.8
    visible: true
    title: qsTr("rM tech day 2024 - responsive design")

    property var tabs: [
    ]

    function previous() {
        if (_currentPage > 0)
            _currentPage--;
    }

    function next() {
        if (_currentPage < (root.tabs.length-1))
            _currentPage++;
    }

    FontLoader {
        id: webFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }

    Binding {
        target: pageLoader.item
        property: "isSmallScreen"
        value: !root._isDesktop
        when: pageLoader.status === Loader.Ready
    }

    Rectangle {
        id: mainContainer

        anchors {
            fill: parent
        }
        color: "black"

        Column {
            id: mainCol

            width: root._isDesktop ? parent.width : parent.width/4
            height: root._isDesktop ? parent.height : parent.height*3/4
            anchors.centerIn: parent

            Components.Header {
                id: header
                width: parent.width; height: Math.max(24, parent.height/20)
                onBigger: root._isDesktop = true;
                onSmaller: root._isDesktop = false;
            }

            Components.Body {
                width: parent.width; height: parent.height - header.height - footer.height

                Row {
                    anchors {
                        fill: parent
                    }

                    Item {
                        id: previous

                        width: Math.max(parent.width/20, 48)
                        height: width
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            width: parent.width; height: width
                            text: "\uf053"
                            font.family: webFont.name
                            font.pixelSize: height
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.previous();
                            }
                        }
                    }

                    Rectangle {
                        id: slide

                        height: parent.height; width: parent.width - previous.width - next.width
                        color: "#2CDE85"
                        radius: 10

                        Rectangle {
                            anchors {
                                fill: parent
                                margins: 8
                            }
                            radius: 16

                            Loader {
                                id: pageLoader
                                anchors {
                                    fill: parent
                                    margins: 0
                                }
                                source: root.tabs[root._currentPage].url
                                onLoaded: {
                                    item.pageNb = root.tabs[root._currentPage].pageNb;
                                }
                            }
                        }
                    }

                    Item {
                        id: next

                        width: Math.max(parent.width/20, 48)
                        height: width
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            width: parent.width; height: width
                            text: "\uf054"
                            font.family: webFont.name
                            font.pixelSize: height
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.next();
                            }
                        }
                    }
                }
            }

            Components.Footer {
                id: footer
                width: parent.width; height: Math.max(24, parent.height/20)
            }
        }
    }
}
