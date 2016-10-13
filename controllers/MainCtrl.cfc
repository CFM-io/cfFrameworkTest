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
component output='false' extends='cffwk.controllers.DefaultCtrl' accessors='true' {
	pageencoding 'utf-8';

	public void function unit() {
		var mySet = new cffwktest.sets.TestsSet();
		mySet.run();
		getRender().render('unit.cfm', {'results' = mySet.getResults()}, 'default.cfm');
	}

}