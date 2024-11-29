import QtQuick

Rectangle {
    id: root

    // public properties
    property bool withViewer
    property int currentPanelIndex: -1
    property bool showTips: false
    property ListModel menus: ListModel {}
    property bool blinking :false
    property real navRatio: 1/15
    property alias loading: loader.loading
    property alias currentPanel: loader.currentItem

    // private properties
    property bool _isLeft: false
    property string _currentTip: ""

    // signals
    signal panelLoaded()

    // functions
    function clearCarousel() {
        menus.clear()
    }

    function insert(index, item, tip) {
        menus.insert(index, { component: item, tip: tip })
    }

    function append(item, tip) {
        menus.append({ component: item, tip: tip })
    }

    function previous() {
        _isLeft = true
        if (currentPanelIndex > 0)
            currentPanelIndex--
        else
            currentPanelIndex = menus.count-1
    }

    function next() {
        _isLeft = false
        if (currentPanelIndex < menus.count-1)
            currentPanelIndex++
        else
            currentPanelIndex = 0
    }

    // Rectangle properties
    clip: nextNav.visible

    onCurrentPanelIndexChanged: {
        if (currentPanelIndex < 0 || currentPanelIndex >= menus.count) {
            loader.source = ""
            return
        }

        loader.source = menus.get(currentPanelIndex).component
    }

    MouseArea {
        id: prevNav

        width: root.menus.count >= 2 ? Math.min(50, parent.width*navRatio) : 0
        visible: width > 0
        onPressed: root.previous()
    }

    MouseArea {
        id: nextNav

        width: root.menus.count >= 2 ? Math.min(50, parent.width*navRatio) : 0
        visible: width > 0
        onPressed: root.next()
    }

    PageLoader {
        id: loader

        animationType: 1
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: prevNav.right
            right: nextNav.left
        }

        onPageLoaded: animationType = 2
    }
}
