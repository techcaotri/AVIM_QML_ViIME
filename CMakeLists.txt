cmake_minimum_required(VERSION 3.16)

project(AVIM_QML_ViIME VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)


qt_add_executable(appAVIM_QML
    main.cpp
)

qt_add_qml_module(appAVIM_QML
    URI AVIM_QML
    VERSION 1.0
    QML_FILES
        Main.qml
        VietTextArea.qml
        simplified-avim.js
        avim.js
        avim_qml.js
        VietTextInput.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAVIM_QML PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAVIM_QML
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAVIM_QML
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appAVIM_QML
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
