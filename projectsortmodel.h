
#ifndef PROJECTSORTMODEL_H
#define PROJECTSORTMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>
#include <regex>

class ProjectSortModel : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QString nameFilter READ nameFilter WRITE setNameFilter NOTIFY filterChanged)

public:
    explicit ProjectSortModel(QObject* parent = nullptr)
        : QSortFilterProxyModel(parent) {};

    QString nameFilter() const
    {
        return nameRegExp.pattern();
    }
    void setNameFilter(const QString& text)
    {
        nameRegExp = (QRegularExpression(text, QRegularExpression::CaseInsensitiveOption));
        updateFilter();
    }

signals:
    void filterChanged();

protected:
    bool filterAcceptsRow(int, const QModelIndex&) const override;

private:
    QRegularExpression nameRegExp;
    void updateFilter();
};

#endif // PROJECTSORTMODEL_H
