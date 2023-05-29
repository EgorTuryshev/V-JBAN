#ifndef USER_H
#define USER_H

#include <QObject>
#include <QSettings>
#include <QString>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString accessToken READ accessToken WRITE setAccessToken NOTIFY accessTokenChanged)
    Q_PROPERTY(QString refreshToken READ refreshToken WRITE setRefreshToken NOTIFY refreshTokenChanged)

public:
    explicit User(QObject* parent = nullptr);

    QString accessToken() const;
    void setAccessToken(const QString& accessToken);

    QString refreshToken() const;
    void setRefreshToken(const QString& refreshToken);

signals:
    void accessTokenChanged();
    void refreshTokenChanged();

private:
    QString m_accessToken;
    QString m_refreshToken;
    QSettings settings { "SguDev", "V-JBAN" };

    QString cipherKey = "gachi-clowns";

    QString encrypt(const QString& token);
    QString decrypt(const QString& cipherText);
};

#endif // USER_H
