int blockX;
int blockY;
int blockSpeed = 5;  

void blockInitialize() {
    blockX = int(random(0, width - playerSize));
    blockY = -playerSize;
}

void drawBlock() {
    fill(255, 0, 0);
    rect(blockX, blockY, playerSize, playerSize);
    
    blockY += blockSpeed;
    
    if (blockY > height) {
        resetBlock();
    }
    
    // ゲームオーバーの判定
    if (isTouchingPlayer()) {
        isGameOver = true;
    }
}

void resetBlock() {
    blockY = -playerSize;
    blockX = int(random(0, width - playerSize));
}

boolean isTouchingPlayer() {
    return blockY + playerSize > height - playerSize && 
    blockY < height && 
    blockX + playerSize > playerX && 
    blockX < playerX + playerSize;
}
