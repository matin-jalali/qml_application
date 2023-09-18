QT += quick core network widgets charts
CONFIG += c++17

SOURCES += src/main.cpp

RESOURCES += src/qml/qml.qrc

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    src/qml/assets/start_up.gif
