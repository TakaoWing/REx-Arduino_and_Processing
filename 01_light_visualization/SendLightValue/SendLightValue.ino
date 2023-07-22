// 定数定義
const int ANALOG_INPUT_PIN = 0;   // アナログ入力ピン
const int ADC_MIN_VALUE = 0;      // 10ビットADCの最小値
const int ADC_MAX_VALUE = 1023;   // 10ビットADCの最大値
const int MAPPED_MIN_VALUE = 0;   // マッピング後の最小値
const int MAPPED_MAX_VALUE = 255; // マッピング後の最大値

void setup()
{
    Serial.begin(9600); // シリアル通信の初期化
}

void loop()
{
    // アナログピンから値を読み取る
    int analogValue = analogRead(ANALOG_INPUT_PIN);

    // ADCの値を0-255の範囲にマッピングする
    int mappedValue = map(analogValue, ADC_MIN_VALUE, ADC_MAX_VALUE, MAPPED_MIN_VALUE, MAPPED_MAX_VALUE);

    // シリアルポートにマッピング後の値を送信
    Serial.write(mappedValue);

    delay(50); // 50ms待機
}
