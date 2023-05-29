#include "user.h"

User::User(QObject* parent)
    : QObject(parent)
{
    m_accessToken  = decrypt(settings.value("accessToken", "").toString());
    m_refreshToken = decrypt(settings.value("refreshToken", "").toString());
}

QString User::accessToken() const { return m_accessToken; }

void User::setAccessToken(const QString& accessToken)
{
    if (m_accessToken != accessToken) {
        m_accessToken = accessToken;
        settings.setValue("accessToken", encrypt(accessToken));
        emit accessTokenChanged();
    }
}

QString User::refreshToken() const { return m_refreshToken; }

void User::setRefreshToken(const QString& refreshToken)
{
    if (m_refreshToken != refreshToken) {
        m_refreshToken = refreshToken;
        settings.setValue("refreshToken", encrypt(refreshToken));
        emit refreshTokenChanged();
    }
}

QString User::encrypt(const QString& token)
{
    QByteArray ba;
    for (int i = 0; i < token.length(); i++)
        ba.append(token.at(i).toLatin1() ^ cipherKey[i % cipherKey.size()].toLatin1());
    return QString(ba.toBase64());
}

QString User::decrypt(const QString& cipherText)
{
    QByteArray ba = QByteArray::fromBase64(cipherText.toLatin1());
    for (int i = 0; i < ba.size(); i++)
        ba[i] = ba[i] ^ cipherKey[i % cipherKey.size()].toLatin1();
    return QString(ba);
}
