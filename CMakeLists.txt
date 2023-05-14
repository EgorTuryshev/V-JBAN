cmake_minimum_required(VERSION 3.16)

project(VJBAN VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 COMPONENTS Gui Quick QuickControls2 Core REQUIRED)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_resources(IMAGE_RESOURCES images.qrc)

qt_add_executable(appVJBAN
    appcore.h
    main.cpp appcore.cpp
    ${IMAGE_RESOURCES}
)

set_target_properties(appVJBAN PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

file(GLOB QML_SOURCES RELATIVE ${CMAKE_SOURCE_DIR} qml/*.qml qml/pages/*.qml qml/controls/*.qml)
source_group("Qml Files" FILES ${QML_SOURCES})

qt_add_qml_module(appVJBAN
    URI VJBAN
    RESOURCE_PREFIX /
    VERSION 1.0
    QML_FILES ${QML_SOURCES}
)

target_link_libraries(appVJBAN
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
    PRIVATE Qt6::QuickControls2
)

install(TARGETS appVJBAN
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
