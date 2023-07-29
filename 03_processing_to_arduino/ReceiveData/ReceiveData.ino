int incomingByte = 0; // 受信するシリアルデータのために準備

void setup()
{
    Serial.begin(9600); // シリアルポートを開き，データレートを9600 bpsにセットする
}

void loop()
{

    // データを受信した場合にのみ，データを送信する
    if (Serial.available() > 0)
    {
        // 受信したデータの1バイトを読み取る
        incomingByte = Serial.read();

        // 受信したデータを出力する
        Serial.print("received data: ");
        Serial.println(incomingByte, DEC);
    }
}