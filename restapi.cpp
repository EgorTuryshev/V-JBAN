
#include "restapi.h"
#include "qjsondocument.h"
#include "qjsonobject.h"

RestAPI::RestAPI(User* user, QObject *parent) : QObject(parent), m_user(user) {
    networkManager = new QNetworkAccessManager(this);
}

QNetworkRequest RestAPI::createRequest(const QString& url) {
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!m_user->accessToken().isEmpty()) {
        request.setRawHeader("Authorize", QString("Bearer %1").arg(m_user->accessToken()).toUtf8());
    }
    return request;
}
void RestAPI::sendLoginRequest(const QString& email, const QString& password) {
    QNetworkRequest request = createRequest("https://sgu-dev.ru/api/login");

    QJsonObject json;
    json.insert("email", email);
    json.insert("password", password);

    QJsonDocument doc(json);
    QByteArray data = doc.toJson();

    QNetworkReply* reply = networkManager->post(request, data);
    connect(reply, &QNetworkReply::finished, [=]() {
        if(reply->error() == QNetworkReply::NoError) {
            QString strReply = reply->readAll();
            QJsonDocument jsonResponse = QJsonDocument::fromJson(strReply.toUtf8());
            QJsonObject jsonObject = jsonResponse.object();
            emit loginResponseReceived(jsonObject["accessToken"].toString(), jsonObject["refreshToken"].toString());
        } else {
            sendRefreshTokenRequest();
        }
        reply->deleteLater();
    });
}

void RestAPI::sendRefreshTokenRequest() {
    QNetworkRequest request = createRequest("https://sgu-dev.ru/api/refresh-token");

    QJsonObject json;
    json.insert("refreshToken", m_user->refreshToken());

    QJsonDocument doc(json);
    QByteArray data = doc.toJson();

    QNetworkReply* reply = networkManager->post(request, data);
    connect(reply, &QNetworkReply::finished, [=]() {
        if(reply->error() == QNetworkReply::NoError) {
            QString strReply = reply->readAll();
            QJsonDocument jsonResponse = QJsonDocument::fromJson(strReply.toUtf8());
            QJsonObject jsonObject = jsonResponse.object();
            emit loginResponseReceived(jsonObject["accessToken"].toString(), jsonObject["refreshToken"].toString());
        }
        reply->deleteLater();
    });
}

