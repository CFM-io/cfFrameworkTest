/**
 * TestsSet
 *
 * @author JLepage
 * @date 13/10/16
 **/
component extends='cffwktest.sets.AbstractSet' accessors=true output=true {

	public void function config() {
		addTest('cffwktest.tests.ObjectTest');
	}


}