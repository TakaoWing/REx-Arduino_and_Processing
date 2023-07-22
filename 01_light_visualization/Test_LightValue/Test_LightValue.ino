const int ANALOG_PIN = 0;            // アナログピン0を使用
const float VOLTAGE_REFERENCE = 5.0; // Arduinoの基準電圧 (5V)
const int ADC_RESOLUTION = 1023;     // 10ビットのADCの解像度

void setup()
{
    Serial.begin(9600); // シリアル通信の開始
}

void loop()
{
    // アナログピンからデータを読み取り 取得する値は0~1023
    int analogValue = analogRead(ANALOG_PIN);

    // アナログの読み取り値を電圧に変換
    float voltage = analogValue * (VOLTAGE_REFERENCE / ADC_RESOLUTION);

    // シリアルポートに電圧値を送信
    Serial.print(voltage);
    // 電圧単位を追加
    Serial.println("V");

    delay(1000); // 1秒待機
}
