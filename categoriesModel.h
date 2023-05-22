#ifndef CATEGORIESMODEL_H
#define CATEGORIESMODEL_H

#include <QAbstractItemModel>

#include "category.h"
#include "qqmlintegration.h"

#define MODEL_CATEGORIES_COLUMN_COUNT 4

class CategoriesModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit CategoriesModel(QObject* parent = nullptr);

    enum PluginRoles
    {
        NameRole = Qt::UserRole + 1,
        TicketsRole,
        IdRole,
        IsFinishRole
    };

    /* ------------------------ Q_INVOKABLES ------------------------ */
    Q_INVOKABLE int rowCount(
        const QModelIndex& parent = QModelIndex()) const override;
    Q_INVOKABLE void removeAt(int);
    Q_INVOKABLE void clear();
    Q_INVOKABLE void append(Category);
    Q_INVOKABLE bool isEmpty() const;
    Q_INVOKABLE void updateFromServer();
    Q_INVOKABLE QList<Category> getCategories();
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex&, int) const override;
    int columnCount(const QModelIndex& parent = QModelIndex()) const override;

    Q_INVOKABLE int getCategoryIndexByName(QString name) const;
    Q_INVOKABLE int indexOfCategory(Category* category) const { return m_categories.indexOf(*category); }
    /* ------------------------ Tickets manipulation ------------------------ */
    Q_INVOKABLE void moveTicket(int fromCategory, int fromIndex, int toCategory, int toIndex);
    Q_INVOKABLE void addTicket(int categoryIndex, Ticket tick) const;
    Q_INVOKABLE void removeTicketByIndex(int categoryIndex, int index) const;
    Q_INVOKABLE Ticket getTicketByIndex(int categoryIndex, int index) const;
    /* ------------------------ DEBUG STUFF ------------------------ */
    Q_INVOKABLE void populate();
    void displayNames();
    Q_INVOKABLE void displayDebugInfo();

private:
    QList<Category> m_categories;

signals:
    void modelChanged();
};

#endif // CATEGORIESMODEL_H
