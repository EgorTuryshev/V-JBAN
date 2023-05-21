#ifndef PROJECT_H
#define PROJECT_H

#include <QObject>
#include <QDateTime>

class Project : public QObject {
    Q_OBJECT
    Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(int ownerId READ ownerId WRITE setOwnerId NOTIFY ownerIdChanged)
    Q_PROPERTY(QDateTime updatedAt READ updatedAt WRITE setUpdatedAt NOTIFY updatedAtChanged)

public:
    explicit Project(QObject *parent = nullptr);
    int id() const;
    void setId(int id);

    QString title() const;
    void setTitle(const QString &title);

    QString description() const;
    void setDescription(const QString &description);

    int ownerId() const;
    void setOwnerId(int ownerId);

    QDateTime updatedAt() const;
    void setUpdatedAt(const QDateTime &updatedAt);

signals:
    void idChanged();
    void titleChanged();
    void descriptionChanged();
    void ownerIdChanged();
    void updatedAtChanged();

private:
    int m_id;
    QString m_title;
    QString m_description;
    int m_ownerId;
    QDateTime m_updatedAt;
};

#endif // PROJECT_H
