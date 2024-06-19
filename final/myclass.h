#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject
{
    Q_OBJECT
public:
    explicit MyClass(QObject *parent = nullptr);

signals:

public slots:
    void driver1Call(); //запускает исполняемый файл driver1 через терминал
    void driver3Call();
    void dmesgCall();//запускает исполняемый файл driver3 через терминал
};

#endif // MYCLASS_H
