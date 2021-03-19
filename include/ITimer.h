#pragma once

#include <QString>

class ITimer {

public:
    virtual ~ITimer() {}

    virtual void startTimer() = 0;

    // signals*
    // *Not a signal really, but can be used as one. ITimer is not a QObject so it cannot use signals.
    virtual void timerChanged(QString timerText) = 0;
};
