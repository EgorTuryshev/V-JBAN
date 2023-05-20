
#ifndef APPCORE_H
#define APPCORE_H
#include <QObject>
#include <QCoreApplication>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "user.h"
#include "restapi.h"
//#include "websocketclient.h"


class appcore : public QObject
{
    Q_OBJECT
public:
    explicit appcore(QObject * parent = nullptr);
    void init();
private:
    QQmlApplicationEngine m_engine;
    User m_user;
    RestAPI m_restAPI;
    //WebSocketClient m_webSocketClient;
private slots:
    void onLoginResponseReceived(QString accessToken, QString refreshToken);
};

#endif // APPCORE_H
