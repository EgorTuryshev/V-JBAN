
#include "projectsortmodel.h"
#include "projectmodel.h"

bool ProjectSortModel::filterAcceptsRow(int sourceRow, const QModelIndex& sourceParent) const
{
    QModelIndex index = sourceModel()->index(sourceRow, 0, sourceParent);
    QString name      = sourceModel()->data(index, ProjectModel::TitleRole).toString();

    return name.contains(nameRegExp);
}

void ProjectSortModel::updateFilter()
{
    invalidateFilter();
    emit filterChanged();
}
