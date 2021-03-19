#pragma once

#include "ITimer.h"

#include <QObject>
#include <memory>

class Adapter : public QObject {
    Q_OBJECT

public:
    explicit Adapter(std::unique_ptr<ITimer> timer);
    ~Adapter();

    void setRootObject(QObject* root);

public slots:
    void onTimerTextChanged(QString time);
    void start();

private:
    QObject* mRoot;

    std::unique_ptr<ITimer> mTimer;
};
