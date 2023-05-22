#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <sys/stat.h>
#include <sys/types.h>

#include "categoriesModel.h"

categoriesModel::categoriesModel(QObject* parent) {}

QHash<int, QByteArray> categoriesModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole]         = "name";
    roles[TicketsRole]      = "tickets";
    roles[IdRole]           = "id";
    roles[IsFinishRole]     = "isfinish";
    return roles;
}

int categoriesModel::rowCount(const QModelIndex& parent) const
{
    return m_categories.size();
}

int categoriesModel::columnCount(const QModelIndex& parent) const
{
    return MODEL_CATEGORIES_COLUMN_COUNT;
}

int categoriesModel::getCategoryIndexByName(QString name) const
{
    foreach(category cat, m_categories)
    {
        if(cat.getName().toLower() == name) return m_categories.indexOf(cat);
    }
    return -1;
}

int categoriesModel::getCategoryIndexById(QString id) const
{
    foreach(category cat, m_categories)
    {
        if(cat.getId().toString() == id) return m_categories.indexOf(cat);
    }
    return -1;
}

void categoriesModel::populate() {
    for (int i = 0; i < 3; ++i) {
        QString categoryName = "Category " + QString::number(i + 1);
        QVariant categoryId = i + 1;
        QVariant isFinish = false;
        category newCategory = category(categoryName, new ticketsModel(), categoryId, isFinish);
        for (int j = 0; j < 2 + i; ++j) {
            QString ticketName = "Ticket " + QString::number(j + 1);
            QStringList people;
            people << "Person " + QString::number(j + 1);
            QVariant ticketId = j + 1;
            QVariant priority = j % 3;
            QVariant difficulty = j % 5;
            QDate startDate(2023, 5, j + 1);
            QDate endDate(2023, 5, j + 2);
            QVariant chat = "Chat " + QString::number(j + 1);
            QString description = "Description of Ticket " + QString::number(j + 1);
            ticket *newTicket = new ticket(ticketName, people, ticketId, priority, difficulty,
                                           startDate, endDate, chat, description);
            newCategory.getTickets()->append(newTicket);
        }
        this->append(newCategory);
    }
}

void categoriesModel::displayNames()
{
    foreach(category cat, m_categories)
    {
        qDebug() << cat.getName();
    }
}

void categoriesModel::displayDebugInfo()
{
    foreach(category cat, m_categories)
    {
        qDebug() << cat.getName();
        qDebug() << cat.getId();
        qDebug() << cat.getIsFinish();
        qDebug() << cat.getTickets();
        cat.getTickets()->displayDebugInfo();
    }
}

QVariant categoriesModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const category& cat = m_categories[index.row()];
    if (role == NameRole)
        return cat.getName();
    if (role == TicketsRole)
        return QVariant::fromValue<QObject *>(m_categories[index.row()].getTickets());
    if (role == IdRole)
        return cat.getId();
    if (role == IsFinishRole)
        return cat.getIsFinish();

    return QVariant();
}

void categoriesModel::removeAt(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    m_categories.removeAt(index);
    endRemoveRows();
    emit modelChanged();
}

void categoriesModel::clear()
{
    beginResetModel();
    m_categories.clear();
    endResetModel();
    emit modelChanged();
}

void categoriesModel::append(category cat)
{
    int index = m_categories.length();
    beginInsertRows(QModelIndex(), index, index);
    m_categories.append(cat);
    endInsertRows();
    emit modelChanged();
}

void categoriesModel::addTicket(int categoryIndex, ticket* tick) const
{
    m_categories.at(categoryIndex).addTicket(tick);
}

void categoriesModel::removeTicketByIndex(int categoryIndex, int index) const
{
    m_categories.at(categoryIndex).removeTicketAt(index);
}

ticket* categoriesModel::getTicketByIndex(int categoryIndex, int index) const
{
    return m_categories.at(categoryIndex).getTickets()->getTickets()->at(index);
}

bool categoriesModel::isEmpty() const
{
    return m_categories.empty();
}

void categoriesModel::updateFromServer()
{
}

void categoriesModel::moveTicket(int fromCategory, int fromIndex, int toCategory, int toIndex)
{
    ticket* tick = getTicketByIndex(fromCategory, fromIndex);
    m_categories.at(toCategory).getTickets()->insertTicketInto(tick, toIndex);
    removeTicketByIndex(fromCategory, fromIndex);

    QModelIndex fromModelIndex = createIndex(fromCategory, 0);
    QModelIndex toModelIndex = createIndex(toCategory, 0);
    emit dataChanged(fromModelIndex, fromModelIndex);
    emit dataChanged(toModelIndex, toModelIndex);
    emit modelChanged();
}

QList<category> categoriesModel::getCategories()
{
    return m_categories;
}
