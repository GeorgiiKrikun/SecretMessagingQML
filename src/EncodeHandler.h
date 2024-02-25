#ifndef ENCODEHANDLER_H
#define ENCODEHANDLER_H

#include <QObject>

class EncodeHandler : public QObject
{
    Q_OBJECT
public:
    explicit EncodeHandler(QObject *parent = nullptr);

public slots:
    QString encode(QString message, QString secret);
    QString decode(QString data);
    void copy(QString string);
    QString paste();

signals:
};

#endif // ENCODEHANDLER_H
