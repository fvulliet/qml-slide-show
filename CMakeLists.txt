cmake_minimum_required(VERSION 3.16)

project(QmlSlideShow VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appQmlSlideShow
    main.cpp
)

qt_add_qml_module(appQmlSlideShow
    URI QmlSlideShow
    VERSION 1.0
    QML_FILES
        Main.qml
        components/Body.qml
        components/Carousel.qml
        components/CodeSlide.qml
        components/Footer.qml
        components/GradientPage.qml
        components/Header.qml
        components/Page.qml
        components/PageLoader.qml
        components/TextSlide.qml
        components/TitleSlide.qml
        pages/Page0.qml
        pages/Page1.qml
        pages/Page2.qml
        pages/Page3.qml
        pages/Page4.qml
        pages/Page5.qml
        pages/Page6.qml
        pages/Page7.qml
        pages/Page8.qml
        pages/Page9.qml
        pages/Page10.qml
        pages/Page11.qml
        pages/Page12.qml
        pages/Page13.qml
        pages/Page14.qml
        pages/Page15.qml
        pages/Page16.qml
        pages/Page99.qml
)

# Add the resource file to the project
qt_add_resources(RESOURCES application.qrc)

# Include the resources in your target
target_sources(appQmlSlideShow PRIVATE ${RESOURCES})

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQmlSlideShow PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQmlSlideShow
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQmlSlideShow
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQmlSlideShow
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
