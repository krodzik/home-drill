#include "Adapter.h"
#include "Timer.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl            url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    // create dependencies = business logic layer
    std::unique_ptr<ITimer> timer = std::make_unique<Timer>();

    // create Adapter object
    auto adapter = std::make_unique<Adapter>(std::move(timer));
    adapter->setRootObject(engine.rootObjects().first());

    return app.exec();
}
