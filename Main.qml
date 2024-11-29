import QtQuick
import "./components" as Components
import "./pages" as Pages

Window {
    id: root

    property int _currentPage: 0

    height: Screen.height * 0.8
    width: Screen.width * 0.8
    visible: true
    title: qsTr("rM tech day 2024 - responsive design")

    property var tabs: [
        { url:Qt.resolvedUrl("./pages/Page0.qml"), pageNb:"" },
        { url:Qt.resolvedUrl("./pages/Page1.qml"), pageNb:"1" },
        { url:Qt.resolvedUrl("./pages/Page2.qml"), pageNb:"2" },
        { url:Qt.resolvedUrl("./pages/Page3.qml"), pageNb:"3" },
        { url:Qt.resolvedUrl("./pages/Page4.qml"), pageNb:"4" },
        { url:Qt.resolvedUrl("./pages/Page5.qml"), pageNb:"5" },
        { url:Qt.resolvedUrl("./pages/Page6.qml"), pageNb:"6" },
        { url:Qt.resolvedUrl("./pages/Page7.qml"), pageNb:"7" },
        { url:Qt.resolvedUrl("./pages/Page8.qml"), pageNb:"8" },
        { url:Qt.resolvedUrl("./pages/Page9.qml"), pageNb:"9" },
        { url:Qt.resolvedUrl("./pages/Page10.qml"), pageNb:"10" },
        { url:Qt.resolvedUrl("./pages/Page11.qml"), pageNb:"11" },
        { url:Qt.resolvedUrl("./pages/Page12.qml"), pageNb:"12" },
        { url:Qt.resolvedUrl("./pages/Page13.qml"), pageNb:"13" },
        { url:Qt.resolvedUrl("./pages/Page14.qml"), pageNb:"14" },
        { url:Qt.resolvedUrl("./pages/Page15.qml"), pageNb:"15" },
        { url:Qt.resolvedUrl("./pages/Page16.qml"), pageNb:"16" },
    ]

    function previous() {
        if (_currentPage > 0) {
            myTansition.start();
            _currentPage--;
        }
    }

    function next() {
        if (_currentPage < (root.tabs.length-1)) {
            myTansition.start();
            _currentPage++;
        }
    }

    function changeDisplay(h, w) {
        root.height = h;
        root.width = w;
        // align center
        root.y = Screen.height / 2 - root.height / 2
        root.x = Screen.width / 2 - root.width / 2
    }

    function displayDesktop() {
        root.changeDisplay(Screen.height * 0.9, Screen.width * 0.9);
    }

    function displayTablet() {
        root.changeDisplay(Screen.height * 0.8, Screen.width * 0.5);
    }

    function displaySmartphone() {
        root.changeDisplay(Screen.height * 0.8, Screen.width * 0.2);
    }

    FontLoader {
        id: webFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }

    Binding {
        target: pageLoader.item
        property: "isSmallScreen"
        value: (root.width < Screen.width/3) || (root.height < Screen.height/3)
        when: pageLoader.status === Loader.Ready
    }

    SequentialAnimation {
        id: myTansition

        ParallelAnimation {
            PropertyAnimation {
                alwaysRunToEnd: true
                target: pageLoader
                property: "x"
                from: 0
                to: -slide.width
            }
            // PropertyAnimation {
            //     alwaysRunToEnd: true
            //     target: pageLoader
            //     property: "opacity"
            //     from: 0.2
            //     to: 0
            // }
        }
        ParallelAnimation {
            PropertyAnimation {
                alwaysRunToEnd: true
                target: pageLoader
                property: "x"
                from: slide.width
                to: 0
            }
            // PropertyAnimation {
            //     alwaysRunToEnd: true
            //     target: pageLoader
            //     property: "opacity"
            //     from: 0
            //     to: 1
            // }
        }
    }

    Rectangle {
        id: mainContainer

        anchors {
            fill: parent
        }
        color: "#2E2E2E" // 2E2E2E 6A737B D0C9C0 F2F2F0
        focus: true

        Keys.onPressed: (event)=> {
                            if (event.key == Qt.Key_Left) root.previous();
                            if (event.key == Qt.Key_Right) root.next();
                            if (event.key == Qt.Key_Plus) {
                                root.height = Math.min(root.height * 1.1, Screen.height);
                                root.width = Math.min(root.width * 1.1, Screen.width);
                            }
                            if (event.key == Qt.Key_Minus) {
                                root.height = Math.max(root.height / 1.1, Screen.height/5);
                                root.width = Math.max(root.width / 1.1, Screen.width/5);
                            }
                            if (event.key == Qt.Key_D) {
                                root.displayDesktop();
                            }
                            if (event.key == Qt.Key_T) {
                                root.displayTablet();
                            }
                            if (event.key == Qt.Key_S) {
                                root.displaySmartphone();
                            }
                        }

        Column {
            id: mainCol

            anchors.fill: parent

            Components.Header {
                id: header
                width: parent.width; height: Math.max(24, parent.height/20)
                onDesktop: root.displayDesktop();
                onTablet: root.displayTablet();
                onSmartphone: root.displaySmartphone();
            }

            Components.Body {
                width: parent.width; height: parent.height - header.height - footer.height

                Row {
                    anchors.fill: parent

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
                            color: "#2CDE85"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.previous();
                            }
                        }
                    }

                    Rectangle {
                        id: slide

                        height: parent.height; width: parent.width - previous.width - next.width
                        color: "#F2F2F0"
                        radius: 10
                        clip: true

                        Loader {
                            id: pageLoader
                            //anchors.fill: parent
                            width: parent.width
                            height: parent.height
                            x: 0
                            y: 0
                            source: root.tabs[root._currentPage].url
                            onLoaded: {
                                item.pageNb = root.tabs[root._currentPage].pageNb;
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
                            color: "#2CDE85"

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
