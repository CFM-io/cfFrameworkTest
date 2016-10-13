/**
 * AbstractElement
 *
 * @author JLepage
 * @date 13/10/16
 **/
component extends='cffwktest.elements.AbstractElement' accessors=true output=true persistent=false {

	public void function run(required any args) {

		if (!fileExists(arguments.args.filename)) {
			fail('Filename ' & arguments.args.filename & ' not found');
		}

	}


}