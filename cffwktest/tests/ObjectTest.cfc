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
component extends='cffwktest.tests.AbstractTest' accessors=true output=true persistent=false {

	public void function prepare() {

		addTest(element = 'CFFileExists', args = {fileName= 'cffwk.base.conf.Config'}, chained = false);

		addTest(element = 'CreateObject', args = {objectName= 'cffwk.base.conf.Config'}, chained = false);
		addTest(element = 'ExtendsObject', args = {className= 'cffwk.base.conf.Route'}, chained = true);
		addTest(element = 'MethodExistsObject', args = {methodName= 'loadParams'}, chained = true);
		addTest(element = 'TestPropertyObject', args = {propertyName= 'env'}, chained = true);



	}

}