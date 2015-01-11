package robotlegs.bender.extensions.navigator.responders {
	import org.flexunit.assertAfterDelay;
	import org.flexunit.asserts.fail;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;
	
	import robotlegs.bender.extensions.navigator.events.NavigatorEvent;
	import robotlegs.bender.extensions.navigator.impl.Navigator;
	import robotlegs.bender.extensions.navigator.impl.ns.hidden;
	import robotlegs.bender.extensions.navigator.impl.transitions.TransitionStatus;
	import robotlegs.bender.extensions.navigator.validation.elements.ResponderAsyncIT;
	import robotlegs.bender.extensions.navigator.validation.elements.ResponderIT;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	/**
	 * @author Eric-Paul Lecluse (c) epologee.com
	 */
	public class TestResponders {
		private var navigator : Navigator;
		private var responderIT : ResponderIT;
		private var responderAsyncIT : ResponderAsyncIT;

		[Before]
		public function setup() : void {
			const context:IContext = new Context();
			navigator = new Navigator(context);
			responderIT = new ResponderIT();
			responderAsyncIT = new ResponderAsyncIT();

			// responderIV = new ResponderIV(NavigationState.make("segment2a"));
			// responderAsyncIV = new ResponderAsyncIV(NavigationState.make("segment2d"));
			// responderIVO1 = new ResponderIVO(NavigationState.make("segment2f"), NavigationState.make("segment2f/segment3a"));
			// responderIVO2 = new ResponderIVO(NavigationState.make("segment2g"), NavigationState.make("segment2g/segment3a"));
			// responderAsyncIVO1 = new ResponderAsyncIVO(NavigationState.make("segment2f"), NavigationState.make("segment2f/segment3a"));
			// responderAsyncIVO2 = new ResponderAsyncIVO(NavigationState.make("segment2g"), NavigationState.make("segment2g/segment3a"));

			// navigator.add(responderIT, "segment1a");
			// navigator.add(responderIT, "segment1b");
			// navigator.add(responderIV, "segment1c");
			// navigator.add(responderAsyncIV, "segment1d");
			// navigator.add(responderIVO1, "segment1e");
			// navigator.add(responderIVO2, "segment1e");
			// navigator.add(responderAsyncIVO1, "segment1f");
			// navigator.add(responderAsyncIVO2, "segment1f");
			// navigator.add(responderIT, "segment1h/*/*/*");

			navigator.start("");
		}

		[Test(order=10)]
		public function simpleAddition() : void {
			navigator.add(responderIT, "synchronous");
			assertThat(navigator.hidden::hasResponder(responderIT), isTrue());

			navigator.add(responderAsyncIT, "asynchronous");
			assertThat(navigator.hidden::hasResponder(responderAsyncIT), isTrue());
		}

		[Test(order=20)]
		public function synchronousAddRemove() : void {
			navigator.add(responderIT, "synchronous");
			assertThat(navigator.hidden::hasResponder(responderIT), isTrue());

			navigator.remove(responderIT, "synchronous");
			assertThat(navigator.hidden::hasResponder(responderIT), isFalse());
		}

		[Test(order=30,timeout=5000)]
		public function asynchronousAddRemove() : void {
			navigator.addEventListener(NavigatorEvent.TRANSITION_STATUS_UPDATED, handleStatusUpdated);
			
			// First add a responder with an asynchronous transition implementation
			navigator.add(responderAsyncIT, "asynchronous");
			assertThat(navigator.hidden::hasResponder(responderAsyncIT), isTrue());

			// Perform the request that triggers the asynchronous transition.
			navigator.request("asynchronous");

			// Immediately remove the async responder
			navigator.remove(responderAsyncIT, "asynchronous");
			assertThat(navigator.hidden::hasResponder(responderAsyncIT), isFalse());

			// After the transition finishes, the completion callback will cause
			// the responder to pop up in the status again. This is check is to make sure
			// that it is removeds properly.
			assertAfterDelay(responderAsyncIT.durationMS + 100, thatAsyncRespondersAreStillGone);
		}

		private function handleStatusUpdated(event : NavigatorEvent) : void {

			var text : String = "";
			for (var responder : * in event.statusByResponder) {
				text += responder + " --> " + TransitionStatus.toString(event.statusByResponder[responder]) + "\n";
			}
			
			//fail(text);
		}

		private function thatAsyncRespondersAreStillGone() : void {
			assertThat(navigator.hidden::hasResponder(responderAsyncIT), isFalse());
		}
	}
}
