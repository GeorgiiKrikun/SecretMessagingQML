#include "EncodeHandler.h"
#include "src/Encoder.h"

#include <QClipboard>
#include <QGuiApplication>


EncodeHandler::EncodeHandler(QObject *parent)
    : QObject{parent}
{}

QString EncodeHandler::encode(QString message, QString secret)
{
    return encoder::mix_text_and_secret(message, secret);
}


QString EncodeHandler::decode(QString data)
{
    return encoder::extract_secret(data);
}

void EncodeHandler::copy(QString string)
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(string);
}

QString EncodeHandler::paste()
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    return clipboard->text();
}





