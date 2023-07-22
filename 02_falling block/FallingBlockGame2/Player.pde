int playerX;    
int moveAmount = 10;  
final byte LEFT_COMMAND = 0x01; 
final byte RIGHT_COMMAND = 0x02; 

void playerInitialize() {
    playerX = width / 2;
}

void drawPlayer() {
    fill(0);
    rect(playerX, height - playerSize, playerSize, playerSize);
}

void movePlayer(byte direction) {
    if (direction == LEFT_COMMAND) {  
        playerX -= moveAmount;
    } else if (direction == RIGHT_COMMAND) {  
        playerX += moveAmount;
    }
    
    playerX = constrain(playerX, 0, width - playerSize);
}
