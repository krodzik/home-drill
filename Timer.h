#pragma once

#include "ITimer.h"

#include <QElapsedTimer>
#include <QObject>
#include <QTime>
#include <QTimer>

class Timer : public QObject, public ITimer {
    Q_OBJECT

public:
    Timer();
    ~Timer();

    void startTimer() override;

signals:
    void timerChanged(QString timerText) override;

private slots:
    void update();

private:
    static const QTime TIME_ZERO;

    std::unique_ptr<QTimer> mTimer;
    QTime                   mTime;
};
