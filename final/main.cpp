#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QTextStream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "myclass.h"


QString readAndDisplayText(const QString &filePath) {
    // Создаем объект QFile и связываем его с файлом
    QFile file(filePath);

    // Открываем файл в режиме чтения
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning("Cannot open file for reading");
         return QString();
    }

    // Создаем QTextStream для чтения данных
    QTextStream in(&file);
        QString content = in.readAll(); // Читаем весь файл
        file.close();
        return content;
    file.close();
    }


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    engine.rootContext()->setContextProperty("page1Text", readAndDisplayText("/proc/devices"));
    engine.rootContext()->setContextProperty("page2Text", readAndDisplayText("/proc/cpuinfo"));
    engine.rootContext()->setContextProperty("page3Text", readAndDisplayText("/proc/meminfo"));
    engine.rootContext()->setContextProperty("page4Text", readAndDisplayText("/home/kraken/gitiuvm/untitled10/dmesg.txt"));
    engine.rootContext()->setContextProperty("page5Text", readAndDisplayText("/home/kraken/gitiuvm/untitled10/lab4.txt"));
    engine.rootContext()->setContextProperty("textSize", 10);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    MyClass myobj; // объект класса, который передает команды в терминал
    engine.rootContext()->setContextProperty("myobj", &myobj);

    return app.exec();
}
