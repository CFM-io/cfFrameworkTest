/**
 * TestsSet
 *
 * @author JLepage
 * @date 13/10/16
 **/
component accessors=true output=true {

	property type="array" name="tests";
	property type="struct" name="results";

	public cffwktest.sets.AbstractSet function init() {
		variables.tests = arrayNew(1);
		variables.results = structNew();

		config();

		return this;
	}

	public void function addTest(required string testObjectName) {
		var cmpt = createObject('component', arguments.testObjectName).init();
		addTestObject(cmpt);
	}

	public void function addTestObject(required cffwktest.tests.AbstractTest oneTestObject) {
		arrayAppend(variables.tests, arguments.oneTestObject);
	}

	public void function run() {
		var i = 1;
		var lg = arrayLen(variables.tests);

		for (var i = 1; i <= lg; i++) {

			var name = variables.tests[i].getName();

			if (isInstanceOf(variables.tests[i], 'cffwktest.tests.AbstractTest')) {
				variables.tests[i].config();
				variables.tests[i].run();

				variables.results[name] = variables.tests[i].getResults();

			}


		}


	}


}