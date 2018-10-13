message("Out path: $${OUT_PWD}")

QT += core gui widgets printsupport webkit webkitwidgets sql network xml dbus qml testlib

CONFIG += link_pkgconfig
PKGCONFIG += tidy


TARGET = tests
TEMPLATE = app

SOURCES += tests.cpp \
           ../src/html/enmlformatter.cpp \
           ../src/logger/qslog.cpp \
           ../src/logger/qslogdest.cpp \
           ../src/logger/qsdebugoutput.cpp \
           ../src/utilities/encrypt.cpp

HEADERS += tests.h \
           ../src/html/enmlformatter.h \
           ../src/logger/qslog.h \
           ../src/logger/qslogdest.h \
           ../src/logger/qsdebugoutput.h \
           ../src/utilities/encrypt.h

CONFIG(debug, debug|release) {
    DESTDIR = qmake-build-debug
    message($$TARGET: Debug build!)
} else {
    DESTDIR = qmake-build-release
    message($$TARGET: Release build!)
}
OBJECTS_DIR = $${DESTDIR}
MOC_DIR = $${DESTDIR}

isEmpty(PREFIX) {
 PREFIX = /usr
}


# install
target.path = $${PREFIX}/abcd
INSTALLS += target
