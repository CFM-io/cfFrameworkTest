/**
 * TestsSet
 *
 * @author JLepage
 * @date 13/10/16
 **/
component extends='cffwktest.sets.AbstractSet' accessors=true output=true {

	public cffwktest.sets.TestsSet function init() {
		super.init();
		return this;
	}

	public void function config() {
		addTest('cffwktest.tests.ObjectTest');
	}


}