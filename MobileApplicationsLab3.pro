# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = MobileApplicationsLab3

CONFIG += sailfishapp

SOURCES += src/MobileApplicationsLab3.cpp

DISTFILES += qml/MobileApplicationsLab3.qml \
    CarImages/1.png \
    CarImages/2.png \
    CarImages/4.png \
    CarImages/5.png \
    CarImages/6.png \
    ObstacleImages/1.png \
    ObstacleImages/2.png \
    ObstacleImages/3.png \
    ObstacleImages/4.png \
    TreeImages/2.png \
    TreeImages/3.png \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/MobileApplicationsLab3.changes.in \
    rpm/MobileApplicationsLab3.changes.run.in \
    rpm/MobileApplicationsLab3.spec \
    rpm/MobileApplicationsLab3.yaml \
    src/Audio/backgroundMusic.mp3 \
    src/Audio/carCrash.mp3 \
    src/Audio/carEngineLoop.wav \
    src/CarImages/1.png \
    src/CarImages/2.png \
    src/CarImages/3.png \
    src/CarImages/4.png \
    src/CarImages/5.png \
    src/CarImages/6.png \
    src/ObstacleImages/1.png \
    src/ObstacleImages/2.png \
    src/ObstacleImages/3.png \
    src/ObstacleImages/4.png \
    src/TreeImages/1.png \
    src/TreeImages/2.png \
    src/TreeImages/3.png \
    translations/*.ts \
    MobileApplicationsLab3.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/MobileApplicationsLab3-de.ts

HEADERS +=

RESOURCES += \
    qml.qrc
