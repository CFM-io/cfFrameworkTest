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
component extends='cffwktest.elements.AbstractElement' accessors=true output=true persistent=false {

	package boolean function _isMethodExists(required struct metadata, required string methodName) {
		for (var i = 1; i <= arrayLen(metadata.functions); i++) {
			if (lCase(metadata.functions[i].name) == lCase(arguments.methodName)) {
				return true;
			}
		}

		if (structKeyExists(metadata, 'extends')) {
			return _isMethodExists(metadata.extends, arguments.methodName);
		}

		return false;

	}

	package string function _getFirstArgumentName(required struct metadata, required string methodName) {

		for (var i = 1; i <= arrayLen(arguments.metadata.functions); i++) {
			if (lCase(arguments.metadata.functions[i].name) == lCase(arguments.methodName)) {
				return arguments.metadata.functions[i].parameters[1].name;

			}

		}

		if (structKeyExists(arguments.metadata, 'extends')) {
			return _getFirstArgumentName(arguments.metadata.extends, arguments.methodName);
		}

		return '';

	}


}