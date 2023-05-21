
#include "category.h"

category::category(const QString& name, ticketsModel* tickets,
                   const QVariant& id, const QVariant& isFinish) :
    m_name(name), m_tickets(tickets),
    m_id(id), m_isFinish(isFinish){}

void category::addTicket(ticket tick) const
{
    m_tickets->append(tick);
}

void category::removeTicketAt(int index) const
{
    m_tickets->removeAt(index);
}


