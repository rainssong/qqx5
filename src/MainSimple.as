package
{
	
	import flash.display.DisplayObjectContainer;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author rainssong
	 */
	public class MainSimple extends Sprite
	{
		//http://zhidao.baidu.com/question/399627144.html
		public function MainSimple():void
		{
			
var score = 0;var combo = 0;var oTF = new TextField();var sTF = new TextField();var inText = "";
var sP = new Sprite();var sight = new Shape();addChild(sTF);addChild(oTF);sTF.defaultTextFormat = 
new TextFormat(null,36,0xFF9900,true,null,null,null,null,"right");sTF.y = sTF.textHeight;sTF.width 
= stage.stageWidth;sTF.text = "Score:" + score;oTF.defaultTextFormat = new TextFormat(null,36,
0x0099FF,true,null,null,null,null,"center");oTF.width = stage.stageWidth;oTF.text = "GO!";oTF.y = 
stage.stageHeight / 2;sP.graphics.lineStyle(1, 0xFFFFFF);sP.graphics.beginFill(0x0099FF, 0.3);
sP.graphics.drawRoundRect(0, 0, 200, 20, 20, 20);sP.graphics.beginFill(0xFFFFFF, 0.9);var t:int=0;
sP.graphics.drawRoundRect(0.75 * sP.width, 0, 0.1 * sP.width, 20, 20, 20);sP.x=stage.stageWidth/2;
sP.y = stage.stageHeight / 2 - 20;sight.graphics.beginFill(0xFF0000);sight.graphics.drawCircle(10,
10,8);addChild   (sP);sP.addChild(sight);stage.addEventListener(KeyboardEvent.KEY_DOWN,onKey);var 
timer           = new Timer(16   ,3000);timer.addEventListener(    "timer",onTimer          );"x";
"shi"           ;t+=t+t+t+00;     timer.addEventListener("tim"      +"eComplete",            /**/
/**/             /*ffffffff*/       function(e:TimerEvent   )      {oTF.text="G"+           "ame"+
"Over!";             });/*  */         timer.start();function           onTimer(              e:
/*ss*/              /*sss*/           TimerEvent):void{sight           .x=10+              timer
/*   */                               .currentCount%100/100*                              (200-20);
if(timer                             .currentCount % 100!=0)                              return;
if(   oTF                          .length>0)combo= 0;inText=                          oTF  .text 
="";for(var i=0;               i < Math.floor  (Math.floor(timer                   .currentCount/
500) + 3); i++)oTF.appendText(["↑", "↓", "←", "→"][Math.floor(Math.random() * 4)]);}function 
onKey(e:KeyboardEvent):void{switch(e.keyCode){case Keyboard.UP:input("↑");break; case Keyboard.DOWN:
input("↓");break;case Keyboard.LEFT:input("←");break;case Keyboard.RIGHT : input("→");break;case 
Keyboard.SPACE :if (oTF.text == inText && oTF.text.length > 0 && timer.currentCount % 100 >= 70 &&
timer.currentCount%100<= 90)score+= 10 + combo * 10,combo++,sTF.text = "Score:"+score.toString(),
oTF.text=inText ="";else oTF.text=inText = "",combo = 0;oTF.textColor = 0x0099FF;break;}}function 
input(content:String):  void{inText +=  content;if (oTF.text.search(inText) != 0)inText = "",oTF
.textColor = 0x0099FF; else oTF.setTextFormat(new TextFormat(null, null, 0xFF9900), 0, inText.length); }

}}}