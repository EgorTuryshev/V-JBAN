#ifndef CATEGORIESMODEL_H
#define CATEGORIESMODEL_H

#include "qqmlintegration.h"
#include <QAbstractItemModel>

#include "category.h"

#define MODEL_CATEGORIES_COLUMN_COUNT 4

class categoriesModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit categoriesModel(QObject* parent = nullptr);

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
    Q_INVOKABLE void append(category);
    Q_INVOKABLE bool isEmpty() const;
    Q_INVOKABLE void updateFromServer();
    Q_INVOKABLE QList<category> getCategories();
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &, int) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    /* ------------------------ DEBUG STUFF ------------------------ */
    void populate();
    void displayNames();
    void displayDebugInfo();
private:
    QList<category> m_categories;

signals:
    void modelChanged();
};

#endif // CATEGORIESMODEL_H
