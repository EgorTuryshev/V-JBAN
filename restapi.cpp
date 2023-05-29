#include <QDebug>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

#include "restapi.h"

RestAPI::RestAPI(User* user, QObject* parent)
    : QObject(parent), m_user(user)
{
    networkManager = new QNetworkAccessManager(this);
}

QNetworkRequest RestAPI::createRequest(const QString& url)
{
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!m_user->accessToken().isEmpty()) {
        request.setRawHeader("Authorization", QString("Bearer %1").arg(m_user->accessToken()).toUtf8());
    }
    return request;
}

void RestAPI::sendLoginRequest(const QString& email, const QString& password)
{
    QNetworkRequest request = createRequest("https://sgu-dev.ru/api/login");

    QJsonObject json;
    json.insert("email", email);
    json.insert("password", password);

    QJsonDocument doc(json);
    QByteArray data = doc.toJson();

    QNetworkReply* reply = networkManager->post(request, data);
    connect(reply, &QNetworkReply::finished, [=]()
        {
        QString strReply = reply->readAll();
        QJsonDocument jsonResponse = QJsonDocument::fromJson(strReply.toUtf8());
        QJsonObject jsonObject = jsonResponse.object();
        if(reply->error() == QNetworkReply::NoError) {
            emit loginResponseReceived(jsonObject["accessToken"].toString(), jsonObject["refreshToken"].toString());
            emit tokensSet();
        }
        else {
//            sendRefreshTokenRequest();
            emit errorReceived(jsonObject["error_msg"].toString());
        }
        reply->deleteLater(); });
}

void RestAPI::sendRefreshTokenRequest()
{
    QNetworkRequest request = createRequest("https://sgu-dev.ru/api/refresh-token");

    QJsonObject json;
    json.insert("refreshToken", m_user->refreshToken());

    QJsonDocument doc(json);
    QByteArray data = doc.toJson();

    QNetworkReply* reply = networkManager->post(request, data);
    connect(reply, &QNetworkReply::finished, [=]()
        {
            if(reply->error() == QNetworkReply::NoError) {
                QString strReply = reply->readAll();
                QJsonDocument jsonResponse = QJsonDocument::fromJson(strReply.toUtf8());
                QJsonObject jsonObject = jsonResponse.object();

                emit loginResponseReceived(jsonObject["accessToken"].toString(), jsonObject["refreshToken"].toString());
            }
            else {
                emit forceLoginPage(); // создайте этот сигнал
            }
            reply->deleteLater(); });
}

void RestAPI::getProjects()
{
    QNetworkRequest request = createRequest("https://sgu-dev.ru/api/project/user");

    QNetworkReply* reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, [=]()
        {
        if(reply->error() == QNetworkReply::NoError) {
            QJsonDocument jsonResponse = QJsonDocument::fromJson(reply->readAll());
            QJsonArray jsonArray = jsonResponse.array();

            QList<Project*> projects;
            foreach (const QJsonValue &value, jsonArray) {
                QJsonObject obj = value.toObject();
                Project *project = new Project();
                project->setId(obj["id"].toInt());
                project->setTitle(obj["title"].toString());
                project->setDescription(obj["descr"].toString());
                project->setOwnerId(obj["owner_id"].toInt());
                project->setUpdatedAt(QDateTime::fromString(obj["updated_at"].toString(), Qt::ISODate));
                projects.append(project);
            }
            emit projectsReceived(projects);
        } else {
            QJsonDocument jsonResponse = QJsonDocument::fromJson(reply->readAll());
            QJsonObject jsonObject = jsonResponse.object();
            emit errorReceived(jsonObject["error_msg"].toString());
            sendRefreshTokenRequest();
        }
        reply->deleteLater(); });
}
