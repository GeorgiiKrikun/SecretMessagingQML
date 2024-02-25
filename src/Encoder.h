#ifndef ENCODER_H
#define ENCODER_H

#include "qtypes.h"

#include <QString>


namespace encoder {


QString encode(QString data);
QString encode_char(quint8 data);
quint8 decode_char(QString data);
QString decode(QString data);
QString remove_unnecessary_symbols(QString data);
// Final pipeline
QString mix_text_and_secret(QString message, QString secret);
QString extract_secret(QString message);

}

#endif // ENCODER_H
