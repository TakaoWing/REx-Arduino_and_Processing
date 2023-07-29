int incomingByte = 0; // 受信するシリアルデータのために準備
const int ledPin = 5; // LEDを接続したPWM対応のピン番号

void setup()
{
    pinMode(ledPin, OUTPUT);
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

        // 受信したデータをLEDの明るさにする
        analogWrite(ledPin, incomingByte);
    }
}