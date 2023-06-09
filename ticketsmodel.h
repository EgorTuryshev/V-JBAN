
#ifndef TICKETSMODEL_H
#define TICKETSMODEL_H

#include <QAbstractItemModel>

#include "qqmlintegration.h"
#include "ticket.h"

#define MODEL_TICKETS_COLUMN_COUNT 9

class TicketsModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit TicketsModel(QObject* parent = nullptr);

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
    Q_INVOKABLE void append(Ticket*);
    Q_INVOKABLE bool isEmpty() const;
    Q_INVOKABLE void updateFromServer();
    Q_INVOKABLE QList<Ticket*>* getTickets();
    
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex&, int) const override;
    int columnCount(const QModelIndex& parent = QModelIndex()) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;

    Q_INVOKABLE void insertTicketInto(Ticket* tick, int position);
    Q_INVOKABLE void moveTicketInternally(int fromIndex, int toIndex);
    // Q_INVOKABLE void moveTicketExternally(int categoryIndex, ticket tick) const;
    /* ------------------------ DEBUG STUFF ------------------------ */
    Q_INVOKABLE void displayDebugInfo();
    Q_INVOKABLE void displayIds();
    void displayNames();

private:
    QList<Ticket*> m_tickets;

signals:
    void modelChanged();
};

#endif // TICKETSMODEL_H
