
#ifndef APPCORE_H
#define APPCORE_H

#include <QCoreApplication>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "projectmodel.h"
#include "projectsortmodel.h"
#include "restapi.h"
#include "user.h"
// #include "websocketclient.h"

class appcore : public QObject
{
    Q_OBJECT
public:
    explicit appcore(QObject* parent = nullptr);
    void init();

private:
    QQmlApplicationEngine m_engine;
    User m_user;
    RestAPI m_restAPI;
    ProjectModel m_projectModel;
    ProjectSortModel m_projectSortModel;
    // WebSocketClient m_webSocketClient;
private slots:
    void onLoginResponseReceived(QString accessToken, QString refreshToken);
};

#endif // APPCORE_H
