#include "myclass.h"
#include <QDebug>
#include <QProcess>
#include <QString>

MyClass::MyClass(QObject *parent) : QObject(parent)
{

}

void MyClass::driver1Call(){
    QProcess process;
    process.start("./driver1");
    process.waitForFinished(-1);
    qDebug() << "driver1 run\n";
}

void MyClass::driver3Call(){
    QProcess process;
    process.start("./driver3");
    process.waitForFinished(-1);
    qDebug() << "driver3 run\n";
}

void MyClass::dmesgCall(){
    QProcess process;
    process.start("dmesg>./untitled10/dmesg.txt");
    process.waitForFinished(-1);
    qDebug() << "driver3 run\n";
}
