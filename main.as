package  {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import caurina.transitions.Tweener;
	import flash.events.TimerEvent;
	
	public class main extends MovieClip {
		public var xml:XML;
		public var xmlLoader:URLLoader=new URLLoader();
		public var TimerDelay:Timer=new Timer(300,1);
		public var obj:Array=new Array();
		public var flag:Boolean=true;//true when icons going out
		public var img_loaded:Boolean=false;
		public var c:int;
		public var speaker_text:Array=new Array();
		public var speaker_topic_text:Array=new Array();
		//public var speaker_title:Array=new Array();
		
		public function main() {
			// constructor code
			
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.EXACT_FIT;
			
			red_mc.enter_btn.addEventListener(MouseEvent.CLICK, clk);
			b1.addEventListener(MouseEvent.CLICK, toggleButtons);
			b2.addEventListener(MouseEvent.CLICK, toggleButtons);
			b3.addEventListener(MouseEvent.CLICK, toggleButtons);
			b4.addEventListener(MouseEvent.CLICK, toggleButtons);
			b5.addEventListener(MouseEvent.CLICK, toggleButtons);
			xmlLoader.load(new URLRequest("speaker_data.xml"));
			xmlLoader.addEventListener(Event.COMPLETE, loadSpeakers);
			//TimerDelay.addEventListener(TimerEvent.TIMER_COMPLETE, toggleLogo);
			logo.addEventListener(MouseEvent.CLICK,toggleButtons);
			obj[0]=b1_img;
			obj[1]=b2_img;
			obj[2]=b3_img;
			obj[3]=b4_img;
			obj[4]=b5_img;
			
			
		}
		
		public function loadSpeakers(ev:Event):void
		{	
			xml=XML(ev.target.data);
			for(var i:int=0;i<6;i++){
				speaker_text[i]=xml.speaker.data[i];
				speaker_topic_text[i]=xml.speaker.topic[i];
				//speaker_title[i]=xml.speaker.title[i];
			}
			
			//trace(xml.speaker.title[0]);
			b1.b1_t.btn_label.text=xml.speaker.title[0];//rakesh
			b2.b2_t.btn_label.text=xml.speaker.title[1];
			b3.b3_t.btn_label.text=xml.speaker.title[2];
			b4.b4_t.btn_label.text=xml.speaker.title[3];
			b5.b5_t.btn_label.text=xml.speaker.title[4];
			//b6.b1_t.btn_label.text=xml.speaker.title[5];
			
		}
		
		public function clk(ev:MouseEvent):void{
			//ev.target.visible=false;
			trace(ev.target+" blah");
		}
		public function speaker_clk(ev:MouseEvent):void{
			//ev.target.visible=false;
			//trace(ev.target+" blah");
			
			toggleButtons(MouseEvent.CLICK);
			
			
			trace(ev.target.name);
		}
		
		public function toggleButtons(ev:MouseEvent):void{
			//b1.visible=!b1.visible;
//			b2.visible=!b2.visible;
//			b3.visible=!b3.visible;
//			b4.visible=!b4.visible;
//			b5.visible=!b5.visible;
			
			if(ev.target.name!='logo')
			{	
				if(flag){
			//TimerDelay.start();
			Tweener.addTween(logo,{y:660,time:1.8});//going down
			Tweener.addTween(b5,{x:1415.4,y:821.15,time:1});
			Tweener.addTween(b2,{x:-235.9,y:-192.8,time:1});
			Tweener.addTween(b3,{x:1411.4,y:-201.8,time:1});
			Tweener.addTween(b4,{x:563.8,y:1122.4,time:1});
			Tweener.addTween(b1,{x:-306.6,y:793.15,time:1});//rakesh
			
			flag=!flag;
			}
				if(!img_loaded){
				c=(ev.target.name.charAt(1))-1;
				speakerinfo.body.text=speaker_text[c];
				topic_bar.speaker_topic.text=speaker_topic_text[c];
				Tweener.addTween(obj[c],{y:75,time:2});
				Tweener.addTween(speakerinfo, {y:65,time:2});
				//if(c!=0)
				//Tweener.addTween(topic_bar, {y:475,time:2});
				//Tweener.addTween(c,{y:117,time:1});
				}
				
				
			}
			else
			{
				Tweener.addTween(obj[c],{y:-485,time:1});
				Tweener.addTween(speakerinfo, {y:-720,time:1});
				//if(c!=0)
				//Tweener.addTween(topic_bar, {y:-194,time:1.4});
				if(!flag){
				Tweener.addTween(logo,{y:314.45,time:0.8});//going up
				Tweener.addTween(b5,{x:991.75,y:360.15,time:1});
				Tweener.addTween(b2,{x:296.05,y:29.3,time:1});
				Tweener.addTween(b3,{x:859.8,y:28,time:1});
				Tweener.addTween(b4,{x:597,y:414,time:1});
				Tweener.addTween(b1,{x:236.4,y:360.15,time:1});
				flag=!flag;
				}
			}
			/*if(flag){
			//TimerDelay.start();
			Tweener.addTween(logo,{y:864,time:1.8});
			Tweener.addTween(b5,{x:1415.4,y:821.15,time:1});
			Tweener.addTween(b2,{x:-235.9,y:-192.8,time:1});
			Tweener.addTween(b3,{x:1411.4,y:-201.8,time:1});
			Tweener.addTween(b4,{x:563.8,y:1122.4,time:1});
			Tweener.addTween(b1,{x:-306.6,y:793.15,time:1});
			flag=!flag;
			}
			else
			{
			Tweener.addTween(logo,{y:457,time:0.8});
			Tweener.addTween(b5,{x:959.5,y:445.2,time:1});
			Tweener.addTween(b2,{x:263.8,y:117,time:1});
			Tweener.addTween(b3,{x:827.6,y:115.8,time:1});
			Tweener.addTween(b4,{x:563.8,y:564.6,time:1});
			Tweener.addTween(b1,{x:213.2,y:445.2,time:1});
			flag=!flag;
			}*/
		}
		
		/*public function toggleLogo(ev:TimerEvent):void{
			if(logo.y!=864)
			Tweener.addTween(logo,{y:864,time:1});
			else
			Tweener.addTween(logo,{y:457,time:1});
		}*/
		
		public function resizeStage(e:Event):void{
			//bg_layer.
		}


	}
}
