
#ifndef TICKET_H
#define TICKET_H

#include "qdatetime.h"
#include <QObject>
#include <QVariant>
#include <QStringListModel>

class ticket
{
public:
    ticket(const QString& name, const QStringList& people,
             const QVariant& id, const QVariant& priority,
             const QVariant& difficulty, const QDate& startDate,
             const QDate& endDate, const QVariant& chat,
             const QString& description);
    QString getName() const {return m_name;};
    QVariant getId() const {return m_id;};
    QStringList getPeople() const{return m_people;};
    QVariant getPriority() const {return m_priority;};
    QVariant getDifficulty() const {return m_difficulty;};
    QDate getStartDate() const {return m_startDate;};
    QDate getEndDate() const {return m_endDate;};
    QVariant getChat() const {return m_chat;};
    QVariant getDescription() const {return m_description;};

private:
    QString m_name;
    QStringList m_people;
    QVariant m_id;
    QVariant m_priority;
    QVariant m_difficulty;
    QDate m_startDate;
    QDate m_endDate;
    QVariant m_chat;
    QString m_description;
};

#endif // TICKET_H
