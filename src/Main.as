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
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			var score:Number = 0;
			var combo:int = 0;
			var oTF:TextField = new TextField();
			var sTF:TextField = new TextField();
			var inText:String = "";
			var sight:Sprite = new Sprite();
			
			addChild(sTF);
			addChild(oTF);
			sTF.defaultTextFormat = new TextFormat(null, 36, 0xFF9900, true, null, null, null, null, "right");
			sTF.y = sTF.textHeight;
			sTF.width = stage.stageWidth;
			sTF.text = "Score:" + score;
			
			oTF.defaultTextFormat = new TextFormat(null, 36, 0x0099FF, true, null, null, null, null, "center");
			oTF.width = stage.stageWidth;
			oTF.text = "GO!";
			oTF.y = stage.stageHeight / 2;
			sight.graphics.lineStyle(1, 0xFFFFFF);
			sight.graphics.beginFill(0x0099FF, 0.3);
			sight.graphics.drawRoundRect(0, 0, stage.stageWidth / 5, 20, 20, 20);
			sight.graphics.beginFill(0xFFFFFF, 0.9);
			sight.graphics.drawRoundRect(0.75 * sight.width, 0, 0.1 * sight.width, 20, 20, 20);
			addChild(sight);
			sight.x = stage.stageWidth / 2;
			sight.y = stage.stageHeight / 2 - 20;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			
			var timer:Timer = new Timer(20, 3000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent)
				{
					oTF.text = "Game Over!";
				});
			timer.start();
			function onKey(e:KeyboardEvent):void
			{
				switch (e.keyCode)
				{
					case Keyboard.UP: 
						input("↑");
						break;
					case Keyboard.DOWN: 
						input("↓");
						break;
					case Keyboard.LEFT: 
						input("←");
						break;
					case Keyboard.RIGHT: 
						input("→");
						break;
					case Keyboard.SPACE: 
						if (oTF.text == inText && oTF.text.length > 0)
							score += 10 + combo * 10, combo++, sTF.text = "Score:" + score.toString(), oTF.text = inText = "";
						else
							oTF.text = inText = "", combo = 0;
						oTF.textColor = 0x0099FF;
						break;
				}
			}
			
			function onTimer():void
			{
				
				if (timer.currentCount % 100 != 0)
					return;
				
				if (oTF.length > 0)
					combo = 0;
				inText = "";
				oTF.text = "";
				for (var i = 0; i < Math.floor(Math.floor(timer.currentCount / 600) + 3); i++)
					oTF.appendText(["↑", "↓", "←", "→"][Math.floor(Math.random() * 4)]);
			}
			function input(content:String):void
			{
				inText += content;
				if (oTF.text.search(inText) != 0)
					inText = "", oTF.textColor = 0x0099FF;
				else
					oTF.setTextFormat(new TextFormat(null, null, 0xFF9900), 0, inText.length);
			}
		}
	
	}
}