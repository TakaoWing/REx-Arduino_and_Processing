import processing.serial.*;

Serial myPort;  
boolean isGameOver = false;  // ゲームオーバーの状態を表す変数
int playerSize = 50;  
String portName = "/dev/tty.usbmodem11301";  // シリアルポートの名前

void setup() {
    size(400, 400);  
    playerInitialize();  // プレイヤー関連の初期化
    blockInitialize();   // ブロック関連の初期化
    
    myPort = new Serial(this, portName, 9600);
}

void draw() {
    background(220);  
    
    if (!isGameOver) {
        drawBlock();       // ブロックの描画
        drawPlayer();      // プレイヤーの描画
    } else {
        displayGameOver();
    }
}

void displayGameOver() {
    background(50);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 2);
}



void serialEvent(Serial myPort) {
    byte data = byte(myPort.read());
    movePlayer(data);
}
