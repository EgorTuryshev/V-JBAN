
#ifndef CATEGORY_H
#define CATEGORY_H

#include <QObject>
#include <QVariant>

#include "ticketsmodel.h"

class Category
{
public:
    Category(const QString& name, TicketsModel* tickets,
        const QVariant& id, const QVariant& isFinish);
    QString getName() const { return m_name; };
    TicketsModel* getTickets() const { return m_tickets; };
    QVariant getId() const { return m_id; };
    QVariant getIsFinish() const { return m_isFinish; };
    bool operator==(const Category& cat) const
    {
        return this->getId() == cat.getId();
    }
  
    void addTicket(Ticket *tick) const;
    void removeTicketAt(int index) const;

private:
    QString m_name;
    TicketsModel* m_tickets;
    QVariant m_id;
    QVariant m_isFinish;
};

#endif // CATEGORY_H
