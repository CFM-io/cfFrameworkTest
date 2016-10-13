/**
 * ObjectTest
 *
 * @author JLepage
 * @date 13/10/16
 **/
component extends='cffwktest.tests.AbstractTest' accessors=true output=true persistent=false {

	public cffwktest.tests.ObjectTest function init() {
		super.init();
		return this;
	}

	public void function config() {
		addTest(element = 'cffwktest.elements.FileExists', args = {fileName= 'index.cfm'}, chained = false);

	}

}