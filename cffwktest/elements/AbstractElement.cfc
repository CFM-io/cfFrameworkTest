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
	property type='cffwk.base.logs.Logger' name='logger';

	property type='string' name='message';

	public cffwktest.elements.AbstractElement function init() {
		variables.message = '';
		return this;
	}

	public string function getName() {
		return getMetaData(this).fullName;
	}

	public boolean function isSuccess() {
		return (trim(variables.message) == '');
	}

	public boolean function hasFail() {
		return !isSuccess();
	}

	package void function fail(required string message) {
		variables.message = arguments.message;
	}


}