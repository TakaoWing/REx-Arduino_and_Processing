import processing.serial.*;

Serial myPort;  
int playerX;    
int playerSize = 50;  
int moveAmount = 10;  
String portName = "/dev/tty.usbmodem11301";  
final byte LEFT_COMMAND = 0x01; 
final byte RIGHT_COMMAND = 0x02; 

int blockX;
int blockY = -playerSize;
int blockSpeed = 5;  

boolean isGameOver = false;  // ゲームオーバーの状態を表す変数

void setup() {
    size(400, 400);  
    playerX = width / 2;  
    blockX = int(random(0, width - playerSize));  
    
    myPort = new Serial(this, portName, 9600);
}

void draw() {
    background(220);  
    
    if (!isGameOver) {
        // ブロックの描画
        fill(255, 0, 0);  
        rect(blockX, blockY, playerSize, playerSize);
        
        blockY += blockSpeed;  
        
        // ブロックが画面の下に達した場合
        if (blockY > height) {
            blockY = -playerSize;  
            blockX = int(random(0, width - playerSize));  
        }
        
        // プレイヤーキャラクターの接触判定
        if (blockY + playerSize > height - playerSize && blockY < height && 
            blockX + playerSize > playerX && blockX < playerX + playerSize) {
            isGameOver = true;  // ゲームオーバーの状態にする
        }
        
        fill(0);  
        rect(playerX, height - playerSize, playerSize, playerSize);
    } else {
        displayGameOver();  // ゲームオーバーのメッセージを表示
    }
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

void displayGameOver() {
    background(50);  // グレーの背景
    fill(255);  // 文字色を白に
    textSize(32);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 2);
}
