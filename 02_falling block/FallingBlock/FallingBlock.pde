import processing.serial.*;

Serial myPort;  
int playerX;    
int playerSize = 50;  
int moveAmount = 10;  
String portName = "/dev/tty.usbmodem11301";  
final byte LEFT_COMMAND = 0x01; 
final byte RIGHT_COMMAND = 0x02; 

int blockX;
int blockY = -playerSize;  // 初期値を-playerSizeにして、最初は見えない位置からスタート
int blockSpeed = 5;  // ブロックが移動する速度

void setup() {
    size(400, 400);  
    playerX = width / 2;  
    blockX = int(random(0, width - playerSize));  // ランダムなX位置をブロックの初期位置に設定
    
    myPort = new Serial(this, portName, 9600);
}

void draw() {
    background(220);  
    
    // ブロックの描画
    fill(255, 0, 0);  // 赤色のブロック
    rect(blockX, blockY, playerSize, playerSize);
    
    blockY += blockSpeed;  // ブロックを下に移動
    
    // ブロックが画面の下に達した場合
    if (blockY > height) {
        blockY = -playerSize;  // ブロックのY位置を再設定
        blockX = int(random(0, width - playerSize));  // ランダムなX位置をブロックの初期位置に設定
    }
    
    fill(0);  
    rect(playerX, height - playerSize, playerSize, playerSize);
}

void serialEvent(Serial myPort) {
    byte data = byte(myPort.read());
    
    if (data == LEFT_COMMAND) {  
        playerX -= moveAmount;
    } else if (data == RIGHT_COMMAND) {  
        playerX += moveAmount;
    }
    
    playerX = constrain(playerX, 0, width - playerSize);
}
