
#ifndef TICKETSMODEL_H
#define TICKETSMODEL_H

#include "qqmlintegration.h"
#include <QAbstractItemModel>

#include "ticket.h"

#define MODEL_TICKETS_COLUMN_COUNT 9

class ticketsModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ticketsModel(QObject* parent = nullptr);

    enum PluginRoles
    {
        NameRole = Qt::UserRole + 1,
        PeopleRole,
        IdRole,
        PriorityRole,
        DifficultyRole,
        StartDateRole,
        EndDateRole,
        ChatRole,
        DescriptionRole
    };

    /* ------------------------ Q_INVOKABLES ------------------------ */
    Q_INVOKABLE int rowCount(
        const QModelIndex& parent = QModelIndex()) const override;
    Q_INVOKABLE void removeAt(int);
    Q_INVOKABLE void clear();
    Q_INVOKABLE void append(ticket);
    Q_INVOKABLE bool isEmpty() const;
    Q_INVOKABLE void updateFromServer();
    Q_INVOKABLE QList<ticket> getTickets();
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &, int) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    /* ------------------------ DEBUG STUFF ------------------------ */
    void displayDebugInfo();
private:
    QList<ticket> m_tickets;

signals:
    void modelChanged();
};

#endif // TICKETSMODEL_H
