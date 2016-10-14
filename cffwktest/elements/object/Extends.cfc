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
component extends='cffwktest.elements.object.AbstractObject' accessors=true output=true persistent=false {

	public any function run(required any args) {

		if (!isInstanceOf(arguments.args.object, arguments.args.className)) {
			fail('Object ' & getMetaData(arguments.args.object).fullName & ' not implements/extends ' & arguments.args.className);
		}


		return arguments.args;


	}


}