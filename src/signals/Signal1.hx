package signals;

import haxe.extern.EitherType;
import signals.Signal.BaseSignal;

typedef Func0or1<T> = EitherType<Void->Void, T->Void>;

@:expose("Signal1")
class Signal1<T> extends BaseSignal<Func0or1<T>> {
	public var value:T;

	public function dispatch(value1:T) {
		sortPriority();
		this.value = value1;
		dispatchCallbacks();
		value = null;
	}

	override function dispatchCallback(callback:Void->Void) {
		callback();
	}

	override function dispatchCallback1(callback:Dynamic->Void) {
		callback(value);
	}

	override function dispatchCallback2(callback:Dynamic->Dynamic->Void) {
		throw "Use Signal 2";
	}
}

// Void->Void // T->Void
