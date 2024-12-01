pragma Singleton

import QtQuick

QtObject {
    id: root

    property string themeName: "theme1"
    property color style_themeColor
    property color style_darkestColor
    property color style_darkColor
    property color style_brightColor
    property color style_brightestColor
    property color style_darkTextColor
    property color style_brightTextColor

    // this theme object hosts all the current color properties
    property var themes: ({})

    readonly property var theme1: {
        'themeName' : 'theme1',
        'style_themeColor': '#2CDE85',
        'style_darkestColor': '#2C2C2C',
        'style_darkColor': '#7D7D7D',
        'style_brightColor': '#D3D3D3',
        'style_brightestColor': '#F2F2F2',
        'style_darkTextColor': '#2C2C2C',
        'style_brightTextColor': '#F2F2F2'
    }

    readonly property var theme2: {
        'themeName' : 'theme2',
        'style_themeColor': '#FF6F61',
        'style_darkestColor': '#1F3A93',
        'style_darkColor': '#B0C4DE',
        'style_brightColor': '#B2BABB',
        'style_brightestColor': '#F2F4F4',
        'style_darkTextColor': '#1F3A93',
        'style_brightTextColor': '#F2F4F4'
    }

    readonly property var theme3: {
        'themeName' : 'theme3',
        'style_themeColor': '#E67E22',
        'style_darkestColor': '#2C3E50',
        'style_darkColor': '#BDC3C7',
        'style_brightColor': '#A9DFBF',
        'style_brightestColor': '#FADBD8',
        'style_darkTextColor': '#2C3E50',
        'style_brightTextColor': '#FADBD8'
    }

    readonly property var theme4: {
        'themeName' : 'theme4',
        'style_themeColor': '#1D9BF0',
        'style_darkestColor': '#000000',
        'style_darkColor': '#FF6EC7',
        'style_brightColor': '#00FF00',
        'style_brightestColor': '#FFFF00',
        'style_darkTextColor': '#2C3E50',
        'style_brightTextColor': '#FADBD8'
    }

    Component.onCompleted: {
        // fill the "themes" object
        for (var prop in root) {
            var theme = root[prop];
            if (theme instanceof Object && theme.themeName) {
                // theme is an object and features a "themeName" property (e.g theme1)
                themes[theme.themeName] = {}
                for(var t = 0; t < Object.keys(theme).length; ++t) {
                    var innerProp = Object.keys(theme)[t]
                    themes[theme.themeName][innerProp] = theme[innerProp]
                }
            }
        }
        root.setTheme(themes.theme1); // default theme
    }

    function toggleTheme() {
        if (themeName === "theme1")
            setThemeName("theme2");
        else if (themeName === "theme2")
            setThemeName("theme3");
        else if (themeName === "theme3")
            setThemeName("theme4");
        else
            setThemeName("theme1");
    }

    // set the provided theme as the current theme
    function setTheme(theme) {
        for(var t = 0; t < Object.keys(theme).length; ++t) {
            var th = Object.keys(theme)[t];
            var prop = theme[th];
            root[th] = prop;
        }
    }

    // set the provided theme name as the current theme;
    // it actually calls the setTheme method
    function setThemeName(name) {
        for (var t in themes) {
            if (themes[t] === themes[name]) {
                setTheme(themes[name]);
            }
        }
    }
}
