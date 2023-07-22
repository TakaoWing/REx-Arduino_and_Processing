const int LEFT_BUTTON_PIN = 2;  // 左のボタンが接続されているピン番号
const int RIGHT_BUTTON_PIN = 3; // 右のボタンが接続されているピン番号

const byte LEFT_COMMAND = 0x01;  // 左ボタンのコマンド
const byte RIGHT_COMMAND = 0x02; // 右ボタンのコマンド

void setup()
{
    Serial.begin(9600);                      // シリアル通信の初期化
    pinMode(LEFT_BUTTON_PIN, INPUT_PULLUP);  // 左のボタンピンを入力モードに設定
    pinMode(RIGHT_BUTTON_PIN, INPUT_PULLUP); // 右のボタンピンを入力モードに設定
}

void loop()
{
    // 左のボタンが押されたか確認
    if (digitalRead(LEFT_BUTTON_PIN) == LOW)
    {
        Serial.write(LEFT_COMMAND);
        delay(200); // デバウンス用の遅延
    }

    // 右のボタンが押されたか確認
    if (digitalRead(RIGHT_BUTTON_PIN) == LOW)
    {
        Serial.write(RIGHT_COMMAND);
        delay(200); // デバウンス用の遅延
    }
}
