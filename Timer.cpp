#include "Timer.h"

const QTime Timer::TIME_ZERO = QTime(0, 0);

Timer::Timer()
    : mTimer(std::make_unique<QTimer>())
{
    connect(mTimer.get(), SIGNAL(timeout()), this, SLOT(update()));

    mTime = QTime(0, 0, 10);
}

Timer::~Timer() {}

void Timer::startTimer()
{
    if (mTimer->isActive())
        mTimer->stop();
    else
        mTimer->start(1000); // update every 1000 msec = 1 sec
}

void Timer::update()
{
    // As it's not the most precise way to measure time it's absolutely enough for our purpose.
    mTime = mTime.addSecs(-1);

    if (mTime <= TIME_ZERO) {
        mTimer->stop();
        mTime.setHMS(0, 0, 10);
        mTimer->start();
    }

    emit timerChanged(mTime.toString("m:ss"));
}
