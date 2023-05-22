#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <sys/stat.h>
#include <sys/types.h>

#include "ticketsmodel.h"

TicketsModel::TicketsModel(QObject* parent) {}

QHash<int, QByteArray> TicketsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole]        = "name";
    roles[PeopleRole]      = "people";
    roles[IdRole]          = "id";
    roles[PriorityRole]    = "priority";
    roles[DifficultyRole]  = "difficulty";
    roles[StartDateRole]   = "startDate";
    roles[EndDateRole]     = "endDate";
    roles[ChatRole]        = "chat";
    roles[DescriptionRole] = "description";
    return roles;
}

int TicketsModel::rowCount(const QModelIndex& parent) const
{
    return m_tickets.size();
}

int TicketsModel::columnCount(const QModelIndex& parent) const
{
    return MODEL_TICKETS_COLUMN_COUNT;
}

bool TicketsModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    if (index.isValid() && role == Qt::EditRole) {
        emit dataChanged(index, index);
        qDebug("F");
        return true;
    }
    return false;
}

void TicketsModel::insertTicketInto(Ticket tick, int position)
{
    m_tickets.insert(position, tick);
}

void TicketsModel::moveTicketInternally(int fromIndex, int toIndex)
{
    if (fromIndex < 0 || fromIndex >= m_tickets.size() || toIndex < 0 || toIndex >= m_tickets.size()) {
        // qDebug() << "Недопустимые индексы.";
        return;
    }

    if (fromIndex == toIndex) {
        // qDebug() << "Начальный и конечный индексы совпадают.";
        return;
    }

    Ticket item = m_tickets.takeAt(fromIndex);
    insertTicketInto(item, toIndex);

    /*QModelIndex fromModelIndex = createIndex(fromIndex, 0);
    QModelIndex toModelIndex = createIndex(toIndex, 0);
    emit dataChanged(fromModelIndex, fromModelIndex);
    emit dataChanged(toModelIndex, toModelIndex);
    emit modelChanged();*/
    qDebug() << "Элемент перемещен.";
    displayNames();
}

void TicketsModel::displayDebugInfo()
{
    foreach (Ticket tick, m_tickets) {
        qDebug() << tick.getName();
        qDebug() << tick.getId();
        qDebug() << tick.getPeople();
        qDebug() << tick.getPriority();
        qDebug() << tick.getDifficulty();
        qDebug() << tick.getStartDate();
        qDebug() << tick.getEndDate();
        qDebug() << tick.getDescription();
        qDebug() << tick.getChat();
    }
}

void TicketsModel::displayIds()
{
    foreach (Ticket tick, m_tickets) {
        qDebug() << tick.getId();
    }
}

void TicketsModel::displayNames()
{
    foreach (Ticket tick, m_tickets) {
        qDebug() << tick.getName();
    }
}

QVariant TicketsModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Ticket& tick = m_tickets[index.row()];
    if (role == NameRole)
        return tick.getName();
    if (role == PeopleRole)
        return tick.getPeople();
    if (role == IdRole)
        return tick.getId();
    if (role == PriorityRole)
        return tick.getPriority();
    if (role == DifficultyRole)
        return tick.getDifficulty();
    if (role == StartDateRole)
        return tick.getStartDate();
    if (role == EndDateRole)
        return tick.getEndDate();
    if (role == ChatRole)
        return tick.getChat();
    if (role == DescriptionRole)
        return tick.getDescription();

    return QVariant();
}

void TicketsModel::removeAt(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    m_tickets.removeAt(index);
    endRemoveRows();
    emit modelChanged();
}

void TicketsModel::clear()
{
    beginResetModel();
    m_tickets.clear();
    endResetModel();
    emit modelChanged();
}

void TicketsModel::append(Ticket tick)
{
    int index = m_tickets.length();
    beginInsertRows(QModelIndex(), index, index);
    m_tickets.append(tick);
    endInsertRows();
    emit modelChanged();
}

bool TicketsModel::isEmpty() const
{
    return m_tickets.empty();
}

void TicketsModel::updateFromServer()
{
}

QList<Ticket> TicketsModel::getTickets()
{
    return m_tickets;
}
