import processing.serial.*;

// シリアル通信の設定
Serial myPort;  
String portName = "/dev/tty.usbmodem11301";  

// プレイヤーの設定
int playerX;    
int playerSize = 50;  
int moveAmount = 10;
final byte LEFT_COMMAND = 0x01; 
final byte RIGHT_COMMAND = 0x02; 

// 落ちてくるブロックの設定
int blockX;
int blockY = -playerSize;
int blockSpeed = 5;  

// ゲームの状態
boolean isGameOver = false;

void setup() {
    // ウィンドウの初期設定
    size(400, 400);  
    playerX = width / 2;  
    blockX = generateRandomBlockX();
    
    // シリアル通信の初期化
    myPort = new Serial(this, portName, 9600);
}

void draw() {
    background(220);  
    
    if (!isGameOver) {
        moveBlock();
        checkBlockCollision();
        drawPlayer();
        drawBlock();
    } else {
        displayGameOver();
    }
}

void serialEvent(Serial myPort) {
    handlePlayerMovement();
}

// ブロックの移動と再生成
void moveBlock() {
    blockY += blockSpeed;
    
    if (blockY > height) {
        resetBlock();
    }
}

void drawBlock() {
    fill(255, 0, 0);  
    rect(blockX, blockY, playerSize, playerSize);
}

void drawPlayer() {
    fill(0);  
    rect(playerX, height - playerSize, playerSize, playerSize);
}

// プレイヤーの移動を制御
void handlePlayerMovement() {
    byte data = byte(myPort.read());
    
    if (data == LEFT_COMMAND) {  
        playerX -= moveAmount;
    } else if (data == RIGHT_COMMAND) {  
        playerX += moveAmount;
    }
    
    playerX = constrain(playerX, 0, width - playerSize);
}

// ブロックとプレイヤーの接触を判定
void checkBlockCollision() {
    if (blockY + playerSize > height - playerSize && blockY < height && 
        blockX + playerSize > playerX && blockX < playerX + playerSize) {
        isGameOver = true;
    }
}

// ゲームオーバーの表示
void displayGameOver() {
    background(50);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 2);
}

// ブロックのX座標をランダムに生成
int generateRandomBlockX() {
    return int(random(0, width - playerSize));
}

// ブロックの位置をリセット
void resetBlock() {
    blockY = -playerSize;
    blockX = generateRandomBlockX();
}
