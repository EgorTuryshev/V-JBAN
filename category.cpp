
#include "category.h"

Category::Category(const QString& name, TicketsModel* tickets,
    const QVariant& id, const QVariant& isFinish)
    : m_name(name), m_tickets(tickets), m_id(id), m_isFinish(isFinish) {}

void Category::addTicket(Ticket tick) const
{
    m_tickets->append(tick);
}

void Category::removeTicketAt(int index) const
{
    m_tickets->removeAt(index);
}
