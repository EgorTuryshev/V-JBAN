#include "project.h"

Project::Project(QObject *parent)
    : QObject(parent),
    m_id(0),
    m_ownerId(0)
{}

int Project::id() const {
    return m_id;
}

void Project::setId(int id) {
    if (id != m_id) {
        m_id = id;
        emit idChanged();
    }
}

QString Project::title() const {
    return m_title;
}

void Project::setTitle(const QString &title) {
    if (title != m_title) {
        m_title = title;
        emit titleChanged();
    }
}

QString Project::description() const {
    return m_description;
}

void Project::setDescription(const QString &description) {
    if (description != m_description) {
        m_description = description;
        emit descriptionChanged();
    }
}

int Project::ownerId() const {
    return m_ownerId;
}

void Project::setOwnerId(int ownerId) {
    if (ownerId != m_ownerId) {
        m_ownerId = ownerId;
        emit ownerIdChanged();
    }
}

QDateTime Project::updatedAt() const {
    return m_updatedAt;
}

void Project::setUpdatedAt(const QDateTime &updatedAt) {
    if (updatedAt != m_updatedAt) {
        m_updatedAt = updatedAt;
        emit updatedAtChanged();
    }
}
