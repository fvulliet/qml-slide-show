import QtQuick

Rectangle {
    id: root

    // public properties
    property int currentPanelIndex: -1
    property ListModel pages: ListModel {}
    property alias loading: loader.loading
    property alias currentPanel: loader.currentItem
    property bool isLeft: false

    // functions
    function append(item, tip) {
        pages.append({ component: item })
    }

    onCurrentPanelIndexChanged: {
        if (currentPanelIndex < 0 || currentPanelIndex >= pages.count) {
            loader.source = ""
            return
        }

        loader.source = pages.get(currentPanelIndex).component
    }

    PageLoader {
        id: loader

        reversedSlide: root.isLeft
        animationType: 1
        anchors.fill: parent
        onPageLoaded: animationType = 2
    }
}
