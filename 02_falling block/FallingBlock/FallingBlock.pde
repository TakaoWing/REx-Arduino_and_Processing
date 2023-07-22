import processing.serial.*;

Serial myPort;  // シリアルポート
int playerX;    // プレイヤーキャラクターのX座標
int playerSize = 50;  // プレイヤーキャラクターのサイズ
int moveAmount = 10;  // 一度に動くピクセル数
String portName = "/dev/tty.usbmodem11301";  //シリアルポート
final byte LEFT_COMMAND = 0x01; // 左ボタンのコマンド
final byte RIGHT_COMMAND = 0x02; // 右ボタンのコマンド

void setup() {
    size(400, 400);  // ウィンドウサイズの設定
    playerX = width / 2;  // プレイヤーキャラクターの初期位置をウィンドウの中央に設定
    
    //シリアル通信の初期化（Arduinoとの通信）
    myPort = new Serial(this, portName, 9600);
}

void draw() {
    background(220);  // 背景の描画
    
    //プレイヤーキャラクターの描画
    fill(0);
    rect(playerX, height - playerSize, playerSize, playerSize);
}

void serialEvent(Serial myPort) {
    byte data = byte(myPort.read());
    
    if (data == LEFT_COMMAND) {  // 左ボタンのコマンドを受け取った場合
        playerX -= moveAmount;
    } else if (data == RIGHT_COMMAND) {  // 右ボタンのコマンドを受け取った場合
        playerX += moveAmount;
    }
    
    //プレイヤーキャラクターの位置がウィンドウの外に出ないように制限
    playerX = constrain(playerX, 0, width - playerSize);
}
