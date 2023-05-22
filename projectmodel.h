
#ifndef PROJECTMODEL_H
#define PROJECTMODEL_H

#include <QAbstractListModel>

#include "project.h"

class ProjectModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles
    {
        IdRole = Qt::UserRole + 1,
        TitleRole,
        DescriptionRole,
        OwnerIdRole,
        UpdatedAtRole
    };

    explicit ProjectModel(QObject* parent = nullptr);
    void addProject(Project* project);

    int rowCount(const QModelIndex& parent = QModelIndex()) const;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<Project*> m_projects;
};

#endif // PROJECTMODEL_H
