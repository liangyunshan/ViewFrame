#-------------------------------------------------
#
# Project created by QtCreator 2018-08-26T09:54:14
#
#-------------------------------------------------

QT       += core gui xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = ViewFrame
TEMPLATE = app

#RC_ICONS += $${TARGET}.ico

CONFIG(debug, debug|release) {

  contains(TEMPLATE, "lib") {
    DESTDIR = ../Lib
    DLLDESTDIR = ../Bin
  } else {
    DESTDIR = ../Bin
  }
} else {
  contains(TEMPLATE, "lib") {
    DESTDIR = ../Lib
    DLLDESTDIR = ../Bin
  } else {
    DESTDIR = ../Bin
  }
}

SOURCES += main.cpp \
    widgets/mainwindow.cpp \
    protocol/datastruct.cpp \
    protocol/protocoldata.cpp \
    file/globalconfigfile.cpp \
    file/xmlparse.cpp \
    global.cpp \
    widgets/taskcontrol/modelview/tableview.cpp \
    widgets/taskcontrol/modelview/tableviewdelegate.cpp \
    widgets/taskcontrol/modelview/tableviewmodel.cpp \
    widgets/taskcontrol/taskcontrol.cpp \
    widgets/taskcontrol/taskcontrolpanel.cpp \
    widgets/taskcontrol/bandcontroldialog.cpp \
    widgets/taskcontrol/turntablecontroldialog.cpp \
    widgets/taskcontrol/statecontroldialog.cpp \
    widgets/taskcontrol/playbackcontroldialog.cpp \
    widgets/taskcontrol/selfcheckcontroldialog.cpp \
    widgets/taskcontrol/instrumentcontroldialog.cpp \
    widgets/taskcontrol/gathercontroldialog.cpp \
    widgets/taskcontrol/task.cpp

HEADERS  += \
    widgets/mainwindow.h \
    protocol/datastruct.h \
    protocol/protocoldata.h \
    file/globalconfigfile.h \
    file/xmlparse.h \
    global.h \
    widgets/taskcontrol/modelview/tableview.h \
    widgets/taskcontrol/modelview/tableviewdelegate.h \
    widgets/taskcontrol/modelview/tableviewmodel.h \
    widgets/taskcontrol/taskcontrol.h \
    widgets/taskcontrol/utils.h \
    widgets/taskcontrol/taskcontrolpanel.h \
    widgets/taskcontrol/bandcontroldialog.h \
    widgets/taskcontrol/turntablecontroldialog.h \
    widgets/taskcontrol/statecontroldialog.h \
    widgets/taskcontrol/playbackcontroldialog.h \
    widgets/taskcontrol/selfcheckcontroldialog.h \
    widgets/taskcontrol/instrumentcontroldialog.h \
    widgets/taskcontrol/gathercontroldialog.h \
    widgets/taskcontrol/task.h \
    widgets/taskcontrol/head.h

FORMS    += mainwindow.ui \
    widgets/taskcontrol/gathercontroldialog.ui

win32-msvc2013{
    LIBS+= ../Lib/Base.lib
    LIBS+= ../Lib/Network.lib
}

win32-g++{
    LIBS+= -L../Lib/ -lBase
    QMAKE_CXXFLAGS_WARN_ON += -Wno-reorder
}

unix{
    LIBS+= -L../Lib/ -lNetwork -lBase
}

INCLUDEPATH += $$PWD/../
INCLUDEPATH += $$PWD/../../$${TARGET}/

RESOURCES += \
    res.qrc
