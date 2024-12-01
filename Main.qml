pragma ComponentBehavior: Bound
import QtQuick
import ThemesModule
import "./components" as Components
import "./pages" as Pages

Window {
    id: root

    property int _countdown: 300 // s
    property bool _cheatWithTime: false

    height: Screen.height * 0.8
    width: Screen.width * 0.8
    visible: true
    title: qsTr("rM tech day 2024 - responsive design")

    Component.onCompleted: {
        // fill the colors of the default theme
        Themes.setThemeName("theme1")
    }

    function previous() {
        carousel.isLeft = true;
        if (carousel.currentPanelIndex > 0) {
            carousel.currentPanelIndex--;
        }
    }

    function next() {
        carousel.isLeft = false;
        if (carousel.currentPanelIndex < (carousel.pages.count-1)) {
            carousel.currentPanelIndex++;
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
        target: carousel.currentPanel
        property: "isSmallScreen"
        value: (root.width < Screen.width/3) || (root.height < Screen.height/3)
    }

    component Nav: Item {
        id: nav

        property alias show: txt.visible
        property alias icon: txt.text

        signal clicked()

        Text {
            id: txt
            width: parent.width; height: width
            font.family: webFont.name
            font.pixelSize: height
            horizontalAlignment: Text.AlignHCenter
            color: Themes.style_themeColor

            MouseArea {
                anchors.fill: parent
                onClicked: nav.clicked();
            }
        }
    }

    Rectangle {
        id: mainContainer

        anchors {
            fill: parent
        }
        color: Themes.style_darkestColor
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
            if (event.key == Qt.Key_D) { // dekstop
                root.displayDesktop();
            }
            if (event.key == Qt.Key_T) { // tablet
                root.displayTablet();
            }
            if (event.key == Qt.Key_S) { // smartphone
                root.displaySmartphone();
            }
            if (event.key == Qt.Key_C) { // color
                Themes.toggleTheme();
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

                    Nav {
                        id: navPrevious
                        show: carousel.currentPanelIndex > 0
                        icon: "\uf053"
                        width: Math.max(parent.width/20, 48)
                        height: width
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: root.previous()
                    }

                    Components.Carousel {
                        id: carousel

                        height: parent.height; width: parent.width - navPrevious.width - navNext.width
                        color: Themes.style_brightestColor
                        radius: 10
                        clip: true
                        Component.onCompleted: {
                            append(Qt.resolvedUrl("./pages/Page0.qml"))
                            append(Qt.resolvedUrl("./pages/Page1.qml"))
                            append(Qt.resolvedUrl("./pages/Page2.qml"))
                            append(Qt.resolvedUrl("./pages/Page3.qml"))
                            append(Qt.resolvedUrl("./pages/Page4.qml"))
                            append(Qt.resolvedUrl("./pages/Page5.qml"))
                            append(Qt.resolvedUrl("./pages/Page6.qml"))
                            append(Qt.resolvedUrl("./pages/Page7.qml"))
                            append(Qt.resolvedUrl("./pages/Page8.qml"))
                            append(Qt.resolvedUrl("./pages/Page9.qml"))
                            append(Qt.resolvedUrl("./pages/Page10.qml"))
                            append(Qt.resolvedUrl("./pages/Page11.qml"))
                            append(Qt.resolvedUrl("./pages/Page12.qml"))
                            append(Qt.resolvedUrl("./pages/Page13.qml"))
                            append(Qt.resolvedUrl("./pages/Page14.qml"))
                            append(Qt.resolvedUrl("./pages/Page15.qml"))
                            append(Qt.resolvedUrl("./pages/Page16.qml"))
                            append(Qt.resolvedUrl("./pages/Page17.qml"))
                            append(Qt.resolvedUrl("./pages/Page18.qml"))
                            append(Qt.resolvedUrl("./pages/Page99.qml"))
                            currentPanelIndex = 0
                        }

                        onCurrentPanelIndexChanged: {
                            if (root._cheatWithTime) {
                                root._countdown += 2;
                            }
                            if (carousel.currentPanelIndex === 1) {
                                root._cheatWithTime = true;
                                timer.start();
                            }
                        }
                    }

                    Nav {
                        id: navNext
                        show: carousel.currentPanelIndex < (carousel.pages.count-1)
                        icon: "\uf054"
                        width: Math.max(parent.width/20, 48)
                        height: width
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: root.next()
                    }
                }
            }

            Components.Footer {
                id: footer
                width: parent.width; height: Math.max(24, parent.height/20)
                timeTxt: `${Math.floor((root._countdown/60)).toString().padStart(2,'0')}:${(root._countdown%60).toString().padStart(2,'0')}`
            }
        }
    }

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            if (root._countdown > 0) {
                root._countdown -= 1;
            } else {
                timer.stop() ;
            }
        }
    }
}
