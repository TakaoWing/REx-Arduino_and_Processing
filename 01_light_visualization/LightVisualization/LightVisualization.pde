import processing.serial.*;

// シリアルポート
Serial port;
// 描画エリアの明るさ
int brightness = 0;  
// Arduinoが接続されている知るあるポート
String portName = "/dev/tty.usbmodem11301";

// Arduino起動時1度だけ実行
void setup() {
    // 描画エリアのサイズを設定
    size(400, 400); 
    
    //シリアル通信の初期化
    port = new Serial(this, portName, 9600);
}

// 起動中ずっと実行
void draw() {
    // 背景の明るさを設定
    background(brightness); 
}

// データの受信があった場合に実行
void serialEvent(Serial port) {
    // シリアルポートからデータを受信
    int data = port.read();
    // データをコンソールに表示
    println(data);
    // 明るさを変更
    brightness = data;
}
