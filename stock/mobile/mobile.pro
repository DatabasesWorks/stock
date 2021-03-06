
TEMPLATE = app
TARGET = Stock.Mobile
QT += qml
CONFIG += c++14 qzxing_qml
DEFINES += CFGFILE_QT_SUPPORT CFGFILE_DISABLE_STL

HEADERS = qml_cpp_bridge.hpp \
	network.hpp \
	cfg_file.hpp \
	list_model.hpp

SOURCES = main.cpp \
	qml_cpp_bridge.cpp \
	network.cpp \
	cfg_file.cpp \
	list_model.cpp

RESOURCES = resources.qrc

DISTFILES += qml/main.qml \
    qml/Connect.qml \
    qml/Actions.qml \
    qml/Busy.qml \
    qml/Change.qml \
    qml/Message.qml \
    qml/Search.qml \
    qml/SearchResult.qml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += android/AndroidManifest.xml

include( ../../3rdparty/qzxing/qzxing/QZXing.pri )
include( ../shared/shared.pri )
include( ../../3rdparty/cfgfile/cfgfile/cfgfile.pri )

TO_GENERATE = ../shared/messages.cfgfile \
	config.cfgfile

QMAKE_EXTRA_COMPILERS += generate_cfg
generate_cfg.name = CONF_GEN
generate_cfg.input = TO_GENERATE
generate_cfg.output = ${QMAKE_FILE_BASE}.hpp
generate_cfg.CONFIG = no_link
generate_cfg.variable_out = HEADERS

CFGFILE_GENERATOR = $$cat( $$PWD/../desktop/cfgfile_generator_path )

generate_cfg.commands = $${CFGFILE_GENERATOR} \
-i ${QMAKE_FILE_IN} -o $${OUT_PWD}/${QMAKE_FILE_BASE}.hpp

PRE_TARGETDEPS += compiler_generate_cfg_make_all
