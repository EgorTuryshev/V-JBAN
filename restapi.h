
#ifndef RESTAPI_H
#define RESTAPI_H

#include <QString>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include "user.h"
#include "project.h"

class RestAPI : public QObject {
    Q_OBJECT

public:
    explicit RestAPI(User* user, QObject *parent = nullptr);
    Q_INVOKABLE void sendLoginRequest(const QString& email, const QString& password);
    Q_INVOKABLE void sendRefreshTokenRequest();
    Q_INVOKABLE void getProjects();

signals:
    void loginResponseReceived(QString accessToken, QString refreshToken);
    void projectsReceived(QList<Project*> projects);
    void errorReceived(QString error);
    void tokensSet();

private:
    QNetworkAccessManager* networkManager;
    User* m_user;

    QNetworkRequest createRequest(const QString& url);
};



#endif // RESTAPI_H
