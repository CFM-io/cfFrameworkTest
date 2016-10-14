/*****

Copyright (c) 2016, Jerome Lepage (j@cfm.io)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

****/
component accessors=true output=true {

	property type='cffwk.base.conf.Config' name='Config';
	property type='component' name='beanFactory';

	property type='array' name='tests';
	property type='struct' name='results';

	public cffwktest.sets.AbstractSet function init() {
		variables.tests = arrayNew(1);
		variables.results = structNew();

		return this;
	}

	public void function addTest(required string testObjectName) {

		var cmpt = getBeanFactory().getBean(arguments.testObjectName);
		addTestObject(cmpt);
	}

	public void function addTestObject(required cffwktest.tests.AbstractTest oneTestObject) {
		arrayAppend(variables.tests, arguments.oneTestObject);
	}

	public void function run() {

		prepare();

		var i = 1;
		var lg = arrayLen(variables.tests);

		for (var i = 1; i <= lg; i++) {

			var name = variables.tests[i].getName();

			if (isInstanceOf(variables.tests[i], 'cffwktest.tests.AbstractTest')) {
				variables.tests[i].prepare();
				variables.tests[i].run();

				variables.results[name] = variables.tests[i].getResults();

			}


		}


	}


}