
#include "ticket.h"

ticket::ticket(const QString &name, const QStringList &people,
               const QVariant &id, const QVariant &priority,
               const QVariant &difficulty, const QDate &startDate,
               const QDate &endDate, const QVariant &chat, const QString &description) :
    m_name(name), m_id(id), m_people(people),
    m_priority(priority), m_difficulty(difficulty),
    m_startDate(startDate), m_endDate(endDate),
    m_chat(chat), m_description(description){};
