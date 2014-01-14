package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	
	public class speaker_btn extends MovieClip {
		public var TimerMC:Timer=new Timer(10,100);
		public var flag:Boolean=false;//true when descending
		public var glow:GlowFilter=new GlowFilter();
		
		public function speaker_btn() {
			// constructor code
			addEventListener(MouseEvent.MOUSE_OVER, speaker_hover);
			addEventListener(MouseEvent.MOUSE_OUT, speaker_hoverOut);
			TimerMC.addEventListener(TimerEvent.TIMER, MC_hover);
			TimerMC.addEventListener(TimerEvent.TIMER_COMPLETE, function(ev:TimerEvent):void {
									 flag=!flag;
									 TimerMC.reset();
									 TimerMC.start();
									 });
	
			glow.alpha=0.8;
			glow.blurX=35;
			glow.blurY=35;
			glow.color=0x009dff; //0xff0000;
			glow.strength=1.25; // i want range from 125-225
			glow.quality=BitmapFilterQuality.HIGH;
			filters=[glow];
		}//end main
		
		function speaker_hover(ev:MouseEvent):void{
			//ev.target.alpha=0.5;
			TimerMC.start();
		}
		function speaker_hoverOut(ev:MouseEvent):void{
			//ev.target.alpha=1;
			glow.strength=1.25;
			filters=[glow];
			TimerMC.stop();
		}
		
		function MC_hover(ev:TimerEvent):void{
			if(flag)
			{//alpha=1-TimerMC.currentCount/100;
			glow.strength=2.25-TimerMC.currentCount/100;
			filters=[glow];
			}
			else
			{//alpha=TimerMC.currentCount/100;
				glow.strength=1.25+TimerMC.currentCount/100;
				filters=[glow];
			}
		}
		
	}
	
}
