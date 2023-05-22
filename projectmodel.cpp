#include "projectmodel.h"

ProjectModel::ProjectModel(QObject* parent)
    : QAbstractListModel(parent)
{
}

void ProjectModel::addProject(Project* project)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_projects << project;
    endInsertRows();
}

int ProjectModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return m_projects.count();
}

QVariant ProjectModel::data(const QModelIndex& index, int role) const
{
    if (index.row() < 0 || index.row() >= m_projects.count())
        return QVariant();

    Project* project = m_projects[index.row()];
    if (role == IdRole)
        return project->id();
    else if (role == TitleRole)
        return project->title();
    else if (role == DescriptionRole)
        return project->description();
    else if (role == OwnerIdRole)
        return project->ownerId();
    else if (role == UpdatedAtRole)
        return project->updatedAt();
    return QVariant();
}

QHash<int, QByteArray> ProjectModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[IdRole]          = "id";
    roles[TitleRole]       = "title";
    roles[DescriptionRole] = "description";
    roles[OwnerIdRole]     = "ownerId";
    roles[UpdatedAtRole]   = "updatedAt";
    return roles;
}
