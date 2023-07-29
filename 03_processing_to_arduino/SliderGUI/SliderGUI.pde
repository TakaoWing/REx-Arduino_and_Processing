import controlP5.*;

ControlP5 cp5;
Slider slider;

void setup() {
  size(400, 300);
  
  cp5 = new ControlP5(this);
  
  // 0から255の範囲でスライダーを作成
  slider = cp5.addSlider("value")
             .setPosition(50, 100)
             .setSize(200, 30)
             .setRange(0, 255)
             .setValue(0)
             .setNumberOfTickMarks(256)  // 256の刻み値を追加
             .snapToTickMarks(true);  // スライダーの値が刻み値にスナップするように設定
}

void draw() {
  background(220);
}

// スライダーの値が変わったときに呼び出されるメソッド
void value(float val) {
  // コンソールにスライダーの値を表示
  println(int(val));
}