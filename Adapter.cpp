#include "Adapter.h"

#include <QDebug>

Adapter::Adapter(std::unique_ptr<ITimer> timer)
    : QObject(nullptr)
    , mRoot(nullptr)
    , mTimer(std::move(timer))
{
    // ITimer
    connect(dynamic_cast<QObject*>(mTimer.get()), SIGNAL(timerChanged(QString)), this,
            SLOT(onTimerTextChanged(QString)));
}

Adapter::~Adapter() {}

void Adapter::setRootObject(QObject* root)
{
    // disconnect from any previous root
    if (mRoot)
        mRoot->disconnect(this);

    mRoot = root;

    if (mRoot) {
        // make connections
        connect(root, SIGNAL(startPressed()), this, SLOT(start()));
    }
}

void Adapter::start()
{
    mTimer->startTimer();
}

void Adapter::onTimerTextChanged(QString time)
{
    if (mRoot)
        mRoot->setProperty("displayTimerText", time);
}
