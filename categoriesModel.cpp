#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <sys/stat.h>
#include <sys/types.h>

#include "categoriesmodel.h"

CategoriesModel::CategoriesModel(QObject* parent) {}

QHash<int, QByteArray> CategoriesModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole]     = "name";
    roles[TicketsRole]  = "tickets";
    roles[IdRole]       = "id";
    roles[IsFinishRole] = "isfinish";
    return roles;
}

int CategoriesModel::rowCount(const QModelIndex& parent) const
{
    return m_categories.size();
}

int CategoriesModel::columnCount(const QModelIndex& parent) const
{
    return MODEL_CATEGORIES_COLUMN_COUNT;
}

int CategoriesModel::getCategoryIndexByName(QString name) const
{
    foreach (Category cat, m_categories) {
        if (cat.getName().toLower() == name)
            return m_categories.indexOf(cat);
    }
    return -1;
}

void CategoriesModel::populate()
{
    for (int i = 0; i < 3; ++i) {
        QString categoryName = "Category " + QString::number(i + 1);
        QVariant categoryId  = i + 1;
        QVariant isFinish    = false;
        Category newCategory = Category(categoryName, new TicketsModel(), categoryId, isFinish);
        for (int j = 0; j < 2 + i; ++j) {
            QString ticketName = "Ticket " + QString::number(j + 1);
            QStringList people;
            people << "Person " + QString::number(j + 1);
            QVariant ticketId   = j + 1;
            QVariant priority   = j % 3;
            QVariant difficulty = j % 5;
            QDate startDate(2023, 5, j + 1);
            QDate endDate(2023, 5, j + 2);
            QVariant chat       = "Chat " + QString::number(j + 1);
            QString description = "Description of Ticket " + QString::number(j + 1);
            Ticket* newTicket   = new Ticket(ticketName, people, ticketId, priority, difficulty,
                  startDate, endDate, chat, description);
            newCategory.getTickets()->append(newTicket);
        }
        this->append(newCategory);
    }
}

int CategoriesModel::getCategoryIndexById(QString id) const
{
    foreach (Category cat, m_categories) {
        if (cat.getId().toString() == id)
            return m_categories.indexOf(cat);
    }
    return -1;
}

void CategoriesModel::displayNames()
{
    foreach (Category cat, m_categories) {
        qDebug() << cat.getName();
    }
}

void CategoriesModel::displayDebugInfo()
{
    foreach (Category cat, m_categories) {
        qDebug() << cat.getName();
        qDebug() << cat.getId();
        qDebug() << cat.getIsFinish();
        qDebug() << cat.getTickets();
        cat.getTickets()->displayDebugInfo();
    }
}

QVariant CategoriesModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Category& cat = m_categories[index.row()];
    if (role == NameRole)
        return cat.getName();
    if (role == TicketsRole)
        return QVariant::fromValue<QObject*>(m_categories[index.row()].getTickets());
    if (role == IdRole)
        return cat.getId();
    if (role == IsFinishRole)
        return cat.getIsFinish();

    return QVariant();
}

void CategoriesModel::removeAt(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    m_categories.removeAt(index);
    endRemoveRows();
    emit modelChanged();
}

void CategoriesModel::clear()
{
    beginResetModel();
    m_categories.clear();
    endResetModel();
    emit modelChanged();
}

void CategoriesModel::append(Category cat)
{
    int index = m_categories.length();
    beginInsertRows(QModelIndex(), index, index);
    m_categories.append(cat);
    endInsertRows();
    emit modelChanged();
}

void CategoriesModel::addTicket(int categoryIndex, Ticket* tick) const
{
    m_categories.at(categoryIndex).addTicket(tick);
}

void CategoriesModel::removeTicketByIndex(int categoryIndex, int index) const
{
    m_categories.at(categoryIndex).removeTicketAt(index);
}

Ticket* CategoriesModel::getTicketByIndex(int categoryIndex, int index) const
{
    return m_categories.at(categoryIndex).getTickets()->getTickets()->at(index);
}

bool CategoriesModel::isEmpty() const
{
    return m_categories.empty();
}

void CategoriesModel::updateFromServer()
{
}

void CategoriesModel::moveTicket(int fromCategory, int fromIndex, int toCategory, int toIndex)
{
    Ticket* tick = getTicketByIndex(fromCategory, fromIndex);
    m_categories.at(toCategory).getTickets()->insertTicketInto(tick, toIndex);
    removeTicketByIndex(fromCategory, fromIndex);

    QModelIndex fromModelIndex = createIndex(fromCategory, 0);
    QModelIndex toModelIndex   = createIndex(toCategory, 0);
    emit dataChanged(fromModelIndex, fromModelIndex);
    emit dataChanged(toModelIndex, toModelIndex);
    emit modelChanged();
}

QList<Category> CategoriesModel::getCategories()
{
    return m_categories;
}
