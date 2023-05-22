
#include "user.h"

User::User(QObject* parent)
    : QObject(parent) {}

QString User::accessToken() const { return m_accessToken; }
void User::setAccessToken(const QString& accessToken)
{
    if (m_accessToken != accessToken) {
        m_accessToken = accessToken;
        emit accessTokenChanged();
    }
}

QString User::refreshToken() const { return m_refreshToken; }
void User::setRefreshToken(const QString& refreshToken)
{
    if (m_refreshToken != refreshToken) {
        m_refreshToken = refreshToken;
        emit refreshTokenChanged();
    }
}
