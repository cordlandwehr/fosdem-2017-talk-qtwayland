CONFIG += wayland-scanner
CONFIG += link_pkgconfig

TARGET = app-eggs

QT += quick waylandclient-private

!contains(QT_CONFIG, no-pkg-config) {
    PKGCONFIG += wayland-client
} else {
    LIBS += -lwayland-client
}

WAYLANDCLIENTSOURCES += ../protocol/custom.xml

SOURCES += main.cpp \
    ../client-common/customextension.cpp

HEADERS += ../client-common/customextension.h

RESOURCES = resources.qrc

target.path = install/
INSTALLS += target
