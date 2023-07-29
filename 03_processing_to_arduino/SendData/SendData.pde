import controlP5.*;
import processing.serial.*;

ControlP5 cp5;
Serial port;
Slider slider;
String portName = "/dev/tty.usbmodem11301";

void setup() {
  size(400, 300);
  
  cp5 = new ControlP5(this);
  
  // 0から255の範囲でスライダーを作成
  slider = cp5.addSlider("value")
             .setPosition(50, 100)
             .setSize(200, 30)
             .setRange(0, 255)
             .setValue(0)
             .setNumberOfTickMarks(256)
             .snapToTickMarks(true);
  
  
  // シリアル通信の設定
  port = new Serial(this, portName, 9600);  // 適切なシリアルポートを選択
}

void draw() {
  background(220);
}

// スライダーの値が変わったときに呼び出されるメソッド
void value(float val) {
  // シリアルポートを通じてスライダーの値を送信
  port.write(int(val));
}
