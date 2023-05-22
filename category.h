
#ifndef CATEGORY_H
#define CATEGORY_H

#include <QObject>
#include <QVariant>

#include "ticketsModel.h"

class category
{
public:
    category(const QString& name, ticketsModel* tickets,
             const QVariant& id, const QVariant& isFinish);
    QString getName() const {return m_name;};
    ticketsModel * getTickets() const {return m_tickets;};
    QVariant getId() const {return m_id;};
    QVariant getIsFinish() const {return m_isFinish;};
    bool operator == (const category& cat) const
    {
        return this->getId() == cat.getId();
    }
    void addTicket(ticket *tick) const;
    void removeTicketAt(int index) const;
private:
    QString m_name;
    ticketsModel * m_tickets;
    QVariant m_id;
    QVariant m_isFinish;
};

#endif // CATEGORY_H
