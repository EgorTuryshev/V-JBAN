#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <sys/stat.h>
#include <sys/types.h>

#include "ticketsModel.h"

ticketsModel::ticketsModel(QObject* parent) {}

QHash<int, QByteArray> ticketsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole]         = "name";
    roles[PeopleRole]       = "people";
    roles[IdRole]           = "id";
    roles[PriorityRole]     = "priority";
    roles[DifficultyRole]   = "difficulty";
    roles[StartDateRole]    = "startDate";
    roles[EndDateRole]      = "endDate";
    roles[ChatRole]         = "chat";
    roles[DescriptionRole]  = "description";
    return roles;
}

int ticketsModel::rowCount(const QModelIndex& parent) const
{
    return m_tickets.size();
}

int ticketsModel::columnCount(const QModelIndex& parent) const
{
    return MODEL_TICKETS_COLUMN_COUNT;
}

bool ticketsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.isValid() && role == Qt::EditRole)
    {
        emit dataChanged(index, index);
        qDebug("F");
        return true;
    }
    return false;
}

void ticketsModel::insertTicketInto(ticket tick, int position)
{
    m_tickets.insert(position, tick);
}

void ticketsModel::moveTicketInternally(int fromIndex, int toIndex)
{
    if (fromIndex < 0 || fromIndex >= m_tickets.size() || toIndex < 0 || toIndex >= m_tickets.size())
    {
        //qDebug() << "Недопустимые индексы.";
        return;
    }

    if (fromIndex == toIndex)
    {
        //qDebug() << "Начальный и конечный индексы совпадают.";
        return;
    }

    ticket item = m_tickets.takeAt(fromIndex);
    insertTicketInto(item, toIndex);

    /*QModelIndex fromModelIndex = createIndex(fromIndex, 0);
    QModelIndex toModelIndex = createIndex(toIndex, 0);
    emit dataChanged(fromModelIndex, fromModelIndex);
    emit dataChanged(toModelIndex, toModelIndex);
    emit modelChanged();*/
    qDebug() << "Элемент перемещен.";
    displayNames();
}

void ticketsModel::displayDebugInfo()
{
    foreach(ticket tick, m_tickets)
    {
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

void ticketsModel::displayIds()
{
    foreach(ticket tick, m_tickets)
    {
        qDebug() << tick.getId();
    }
}

void ticketsModel::displayNames()
{
    foreach(ticket tick, m_tickets)
    {
        qDebug() << tick.getName();
    }
}

QVariant ticketsModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const ticket& tick = m_tickets[index.row()];
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

void ticketsModel::removeAt(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    m_tickets.removeAt(index);
    endRemoveRows();
    emit modelChanged();
}

void ticketsModel::clear()
{
    beginResetModel();
    m_tickets.clear();
    endResetModel();
    emit modelChanged();
}

void ticketsModel::append(ticket tick)
{
    int index = m_tickets.length();
    beginInsertRows(QModelIndex(), index, index);
    m_tickets.append(tick);
    endInsertRows();
    emit modelChanged();
}

bool ticketsModel::isEmpty() const
{
    return m_tickets.empty();
}

void ticketsModel::updateFromServer()
{
}

QList<ticket> ticketsModel::getTickets()
{
    return m_tickets;
}
