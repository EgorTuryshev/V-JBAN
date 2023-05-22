
#include "appcore.h"
#include "categoriesModel.h"

appcore::appcore(QObject *parent) : QObject(parent), m_restAPI(&m_user) {
    connect(&m_restAPI, &RestAPI::loginResponseReceived, this, &appcore::onLoginResponseReceived);
    connect(&m_restAPI, &RestAPI::projectsReceived, this, [=](QList<Project*> projects) {
        foreach (Project *project, projects) {
            m_projectModel.addProject(project);
        }
    });
}

void appcore::init() {
    m_engine.rootContext()->setContextProperty("restAPI", &m_restAPI);
    m_engine.rootContext()->setContextProperty("user", &m_user);
    m_engine.rootContext()->setContextProperty("projectModel", &m_projectModel);
    m_engine.rootContext()->setContextProperty("projectSortModel", &m_projectSortModel);
    m_projectSortModel.setSourceModel(&m_projectModel);

    categoriesModel categories;
    categories.populate();
    m_engine.rootContext()->setContextProperty("categories", &categories);
    qmlRegisterType<categoriesModel>("MyApp", 1, 0, "CategoriesModel");
    qmlRegisterType<ticketsModel>("MyApp", 1, 0, "TicketsModel");
    m_engine.addImportPath(":/");
    m_engine.load(QUrl(QStringLiteral("qrc:/VJBAN/qml/Main.qml")));
}

void appcore::onLoginResponseReceived(QString accessToken, QString refreshToken) {
    m_user.setAccessToken(accessToken);
    m_user.setRefreshToken(refreshToken);
}


