
#ifndef RESTAPI_H
#define RESTAPI_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QString>

#include "project.h"
#include "user.h"

class RestAPI : public QObject
{
    Q_OBJECT

public:
    explicit RestAPI(User* user, QObject* parent = nullptr);
    Q_INVOKABLE void sendLoginRequest(const QString& email, const QString& password);
    Q_INVOKABLE void sendRefreshTokenRequest();
    Q_INVOKABLE void getProjects();

signals:
    void loginResponseReceived(QString accessToken, QString refreshToken);
    void projectsReceived(QList<Project*> projects);
    void forceLoginPage();
    void errorReceived(QString error);
    void tokensSet();

private:
    QNetworkAccessManager* networkManager;
    User* m_user;

    QNetworkRequest createRequest(const QString& url);
};

#endif // RESTAPI_H
