#include "Encoder.h"


QString i_0 = u8"\u200C";
QString i_1 = u8"\u200D";

QString encoder::encode_char(quint8 data)
{
    std::vector<quint8> bits;
    for (int i = 0; i < 8; i++)
    {
        bits.push_back((data >> i) & 1);
    }
    QString result;
    for (auto bit : bits)
    {
        if (!bit)
            result += i_0;
        else
            result += i_1;
    }
    return result;
}


 QString encoder::encode(const QString data)
{
    QByteArray byte_data = data.toUtf8();
    QString result;
    for (int i = 0; i < byte_data.size(); i++)
    {
        quint8 byte = byte_data[i];
        result += encoder::encode_char(byte);
    }
    return result;
}


quint8 encoder::decode_char(QString data)
{
    quint8 result = 0;
    for (int i = 0; i < 8; i++)
    {
        if (data[i] == i_1)
        {
            result |= (1 << i);
        }
    }
    return result;
}


QString encoder::decode(QString data)
{
    if (data.size() % 8 != 0)     {
        return "";
    }
    QByteArray result;
    for (int b = 0; b < data.size(); b += 8) {
        QString byte = data.mid(b, 8);
        result.append(encoder::decode_char(byte));
    }
    return QString::fromUtf8(result);
}

QString encoder::remove_unnecessary_symbols(QString data)
{
    QString result;
    for (auto c : data)
    {
        if (c == i_0 || c == i_1)
        {
            result += c;
        }
    }
    return result;
}

QString encoder::mix_text_and_secret(QString message, QString secret)
{
    QString message_first_half = message.mid(0, message.size() / 2);
    QString message_second_half = message.mid(message.size() / 2);
    QString encoded_secret = encoder::encode(secret);
    return message_first_half + encoded_secret + message_second_half;
}


QString encoder::extract_secret(QString message)
{
    return encoder::decode(
        encoder::remove_unnecessary_symbols(message)
    );
}
