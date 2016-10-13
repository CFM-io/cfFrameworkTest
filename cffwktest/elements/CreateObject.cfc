/**
 * AbstractElement
 *
 * @author JLepage
 * @date 13/10/16
 **/
component extends='cffwktest.elements.AbstractElement' accessors=true output=true persistent=false {

	public void function run(required any args) {

		try {
			var obj = createObject('component', arguments.args.objectName).init();


		} catch ( any e ) {
			fail('Can''t create object ' & arguments.args.objectName & '');

		}

	}


}