#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "appcore.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
        []()
        { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    appcore appcore;
    appcore.init();

    return app.exec();
}
