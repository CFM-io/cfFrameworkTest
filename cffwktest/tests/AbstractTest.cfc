/**
 * AbstractTest
 *
 * @author JLepage
 * @date 13/10/16
 **/
component accessors=true output=true persistent=false {

	property type="array" name="testElements";
	property type="array" name="results";

	public cffwktest.tests.AbstractTest function init() {
		_checkTestIsCorrect();
		variables.testElements = arrayNew(1);
		variables.results = arrayNew(1);
		return this;
	}

	public string function getName() {
		return getMetaData(this).fullName;
	}

	private void function _checkTestIsCorrect() {
		_checkFunctionExists('run');
	}

	private boolean function _checkFunctionExists(required string functionName) {
		var funcArray = getMetadata(this).functions;
		for (var i = 1; i <= arrayLen(funcArray); ++i) {
			if (funcArray[i].name == arguments.functionName) {
				return true;
			}
		}

		throw('Your object should have the method ' & arguments.functionName);
	}

	public boolean function shoulBeTrue(required any results) {
		if (arguments.results == true) {
			return true;
		}

		return false;
	}

	public void function config() {}

	public void function addTest(required string element, struct args =  {}, boolean chained = false ) {
		var cmpt = createObject('component', arguments.element);
		addTestObject(cmpt, arguments.args, arguments.chained);
	}

	public void function addTestObject(required component cmpt, struct args =  {}, boolean chained = false ) {
		var curTest = {'component'= arguments.cmpt, 'args'= arguments.args, 'chained'= arguments.chained};
		arrayAppend(getTestElements(), curTest);
	}


	public void function run() {
		var args = {};
		var els = getTestElements();

		for (var i = 1; i <= arrayLen(els); i++) {
			var cmp = els[i].component;

			if (!els[i].chained) {
				args = els[i].args;
			}

			args = cmp.run(args);

			var curTest = {};
			curTest['name'] = cmp.getName();
			curTest['success'] = cmp.isSuccess();
			curTest['message'] = cmp.getMessage();

			arrayAppend(variables.results, curTest);

		}

	}


}