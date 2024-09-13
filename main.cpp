#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  qputenv("QML_XHR_ALLOW_FILE_READ", QByteArray("1"));
  qputenv("QML_XHR_ALLOW_FILE_READ", QByteArray("128"));
  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/AVIM_QML/Main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated,
      &app, [url](QObject *obj, const QUrl &objUrl) {
        if (! obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
