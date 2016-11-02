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
component accessors=true output=true persistent=false {

	property type='cffwk.base.conf.Config' name='Config';
	property type='cffwk.model.iocAdapters.iocAdapterInterface' name='iocAdapter';

	property type='array' name='testElements';
	property type='array' name='results';

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
		_checkFunctionExists('prepare');
	}

	private boolean function _checkFunctionExists(required string functionName) {
		var funcArray = getMetadata(this).functions;
		for (var i = 1; i <= arrayLen(funcArray); ++i) {
			if (funcArray[i].name == arguments.functionName) {
				return true;
			}
		}

		throw('Your object ' & getName() & ' should have the method ' & arguments.functionName);
	}

	public boolean function shoulBeTrue(required any results) {
		if (arguments.results == true) {
			return true;
		}

		return false;
	}

	public void function prepare() {}

	public void function addTest(required string element, struct args =  {}, boolean chained = false ) {
		var cmpt = variables.iocAdapter.getobject(arguments.element);
		addTestObject(cmpt, arguments.args, arguments.chained);
	}

	public void function addTestObject(required component cmpt, struct args =  {}, boolean chained = false ) {
		var curTest = {'component'= arguments.cmpt, 'args'= arguments.args, 'chained'= arguments.chained};
		arrayAppend(variables.testElements, curTest);
	}


	public void function run() {
		var args = {};
		var els = getTestElements();

		for (var i = 1; i <= arrayLen(els); i++) {
			var cmp = els[i].component;

			if (els[i].chained) {
				structAppend(args, els[i].args);

			} else {
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