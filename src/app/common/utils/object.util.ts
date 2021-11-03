'use strict';
export default class ObjectUtil {

    static verifyObj(object:object, propertyName:string): [any, null] {
        if (!object) { return null; }
        if (typeof object[propertyName] !== 'undefined') {
            return object[propertyName];
        } else {
            return null;
        }
    }

    static getKeyFromObject(obj:any, value:any) {
        for (const key in obj) {
            const o = obj[key];
            if (o == value) {
                return key;
            }
        }
    }

    static findKeyEnum(enumType:any, key:string) {
        const enums = (enumType.enums) ? enumType.enums : enumType;
        let result = enums.find(function (element) {
            if (element.value === key)
                return element;
        });
        return typeof result !== 'undefined' ? result.key : null;
    }

    static isEmpty(obj) {
        // null and undefined are "empty"
        if (obj == null) return true;

        // Assume if it has a length property with a non-zero value
        // that property is correct
        if (obj.length > 0) return false;
        if (obj.length === 0) return true;

        // if it ins't an object at this point
        // it is empty, but it can't be anything but empty
        // Is it empty ? Depends on your application
        if (typeof obj !== "object") return true;

        // Otherwise, does it have any properties of its own?
        // Note that this doesn't handle
        // toString and valueOf enumeration bugs in IE < 9
        for (var key in obj) {
            if (hasOwnProperty.call(obj, key)) return false;
        }

        return true;
    }

    static normalize(text:string) {
        if (text == null || text == undefined) {
            return null;
        }
        return text.normalize('NFD').replace(/[\u0300-\u036f]/g, "");
    }

    static isObjectType(o:any) {
        if (!o) { return false; }
        if(typeof o === 'object'){ 
            return true;
        }
        return null;
    }

}
