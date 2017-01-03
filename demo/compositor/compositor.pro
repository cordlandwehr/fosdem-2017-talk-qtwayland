QT += core gui qml

QT += waylandcompositor-private

CONFIG += wayland-scanner
CONFIG += c++11
SOURCES += \
    main.cpp \
    customextension.cpp

OTHER_FILES = \
    qml/Main.qml \
    qml/Screen.qml \
    images/background.jpg

WAYLANDSERVERSOURCES += \
            ../protocol/custom.xml

RESOURCES += compositor.qrc

contains(QT_CONFIG, no-pkg-config) {
    LIBS += -lwayland-server
} else {
    CONFIG += link_pkgconfig
    PKGCONFIG += wayland-server
}

TARGET = compositor

HEADERS += \
    customextension.h

target.path = install/
INSTALLS += target
