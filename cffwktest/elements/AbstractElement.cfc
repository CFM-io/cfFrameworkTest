/**
 * AbstractElement
 *
 * @author JLepage
 * @date 13/10/16
 **/
component accessors=true output=true persistent=false {

	property type="string" name="message";

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