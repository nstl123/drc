
/**
 * This is a generated class and is not intended for modification.  
 */
package valueObjects
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _DemandLIneEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("pwrTypeID", "batTypeID", "Y2004", "Y2012", "countryName", "batTypeName", "Y2008", "Y2007", "batPwrName", "Y2006", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("pwrTypeID", "batTypeID", "Y2004", "Y2012", "countryName", "batTypeName", "Y2008", "Y2007", "batPwrName", "Y2006", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("pwrTypeID", "batTypeID", "Y2004", "Y2012", "countryName", "batTypeName", "Y2008", "Y2007", "batPwrName", "Y2006", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("pwrTypeID", "batTypeID", "Y2004", "Y2012", "countryName", "batTypeName", "Y2008", "Y2007", "batPwrName", "Y2006", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "DemandLIne";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _countryNameIsValid:Boolean;
    model_internal var _countryNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _countryNameIsValidCacheInitialized:Boolean = false;
    model_internal var _countryNameValidationFailureMessages:Array;
    
    model_internal var _batTypeNameIsValid:Boolean;
    model_internal var _batTypeNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _batTypeNameIsValidCacheInitialized:Boolean = false;
    model_internal var _batTypeNameValidationFailureMessages:Array;
    
    model_internal var _batPwrNameIsValid:Boolean;
    model_internal var _batPwrNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _batPwrNameIsValidCacheInitialized:Boolean = false;
    model_internal var _batPwrNameValidationFailureMessages:Array;
    
    model_internal var _deviceNameIsValid:Boolean;
    model_internal var _deviceNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _deviceNameIsValidCacheInitialized:Boolean = false;
    model_internal var _deviceNameValidationFailureMessages:Array;

    model_internal var _instance:_Super_DemandLIne;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _DemandLIneEntityMetadata(value : _Super_DemandLIne)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["pwrTypeID"] = new Array();
            model_internal::dependentsOnMap["batTypeID"] = new Array();
            model_internal::dependentsOnMap["Y2004"] = new Array();
            model_internal::dependentsOnMap["Y2012"] = new Array();
            model_internal::dependentsOnMap["countryName"] = new Array();
            model_internal::dependentsOnMap["batTypeName"] = new Array();
            model_internal::dependentsOnMap["Y2008"] = new Array();
            model_internal::dependentsOnMap["Y2007"] = new Array();
            model_internal::dependentsOnMap["batPwrName"] = new Array();
            model_internal::dependentsOnMap["Y2006"] = new Array();
            model_internal::dependentsOnMap["Y2005"] = new Array();
            model_internal::dependentsOnMap["Y2010"] = new Array();
            model_internal::dependentsOnMap["sessionID"] = new Array();
            model_internal::dependentsOnMap["deviceName"] = new Array();
            model_internal::dependentsOnMap["scenarioID"] = new Array();
            model_internal::dependentsOnMap["Y2009"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_countryNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCountryName);
        model_internal::_countryNameValidator.required = true;
        model_internal::_countryNameValidator.requiredFieldError = "countryName is required";
        //model_internal::_countryNameValidator.source = model_internal::_instance;
        //model_internal::_countryNameValidator.property = "countryName";
        model_internal::_batTypeNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForBatTypeName);
        model_internal::_batTypeNameValidator.required = true;
        model_internal::_batTypeNameValidator.requiredFieldError = "batTypeName is required";
        //model_internal::_batTypeNameValidator.source = model_internal::_instance;
        //model_internal::_batTypeNameValidator.property = "batTypeName";
        model_internal::_batPwrNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForBatPwrName);
        model_internal::_batPwrNameValidator.required = true;
        model_internal::_batPwrNameValidator.requiredFieldError = "batPwrName is required";
        //model_internal::_batPwrNameValidator.source = model_internal::_instance;
        //model_internal::_batPwrNameValidator.property = "batPwrName";
        model_internal::_deviceNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDeviceName);
        model_internal::_deviceNameValidator.required = true;
        model_internal::_deviceNameValidator.requiredFieldError = "deviceName is required";
        //model_internal::_deviceNameValidator.source = model_internal::_instance;
        //model_internal::_deviceNameValidator.property = "deviceName";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::dataProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity DemandLIne");  
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity DemandLIne");  

        return model_internal::collectionBaseMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity DemandLIne");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity DemandLIne");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity DemandLIne");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isPwrTypeIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBatTypeIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2004Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2012Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCountryNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBatTypeNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2008Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2007Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBatPwrNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2006Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2005Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2010Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSessionIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDeviceNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isScenarioIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2009Available():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnCountryName():void
    {
        if (model_internal::_countryNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfCountryName = null;
            model_internal::calculateCountryNameIsValid();
        }
    }
    public function invalidateDependentOnBatTypeName():void
    {
        if (model_internal::_batTypeNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfBatTypeName = null;
            model_internal::calculateBatTypeNameIsValid();
        }
    }
    public function invalidateDependentOnBatPwrName():void
    {
        if (model_internal::_batPwrNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfBatPwrName = null;
            model_internal::calculateBatPwrNameIsValid();
        }
    }
    public function invalidateDependentOnDeviceName():void
    {
        if (model_internal::_deviceNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDeviceName = null;
            model_internal::calculateDeviceNameIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get pwrTypeIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get batTypeIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2004Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2012Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get countryNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get countryNameValidator() : StyleValidator
    {
        return model_internal::_countryNameValidator;
    }

    model_internal function set _countryNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_countryNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_countryNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get countryNameIsValid():Boolean
    {
        if (!model_internal::_countryNameIsValidCacheInitialized)
        {
            model_internal::calculateCountryNameIsValid();
        }

        return model_internal::_countryNameIsValid;
    }

    model_internal function calculateCountryNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_countryNameValidator.validate(model_internal::_instance.countryName)
        model_internal::_countryNameIsValid_der = (valRes.results == null);
        model_internal::_countryNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::countryNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::countryNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get countryNameValidationFailureMessages():Array
    {
        if (model_internal::_countryNameValidationFailureMessages == null)
            model_internal::calculateCountryNameIsValid();

        return _countryNameValidationFailureMessages;
    }

    model_internal function set countryNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_countryNameValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_countryNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get batTypeNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get batTypeNameValidator() : StyleValidator
    {
        return model_internal::_batTypeNameValidator;
    }

    model_internal function set _batTypeNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_batTypeNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_batTypeNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "batTypeNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get batTypeNameIsValid():Boolean
    {
        if (!model_internal::_batTypeNameIsValidCacheInitialized)
        {
            model_internal::calculateBatTypeNameIsValid();
        }

        return model_internal::_batTypeNameIsValid;
    }

    model_internal function calculateBatTypeNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_batTypeNameValidator.validate(model_internal::_instance.batTypeName)
        model_internal::_batTypeNameIsValid_der = (valRes.results == null);
        model_internal::_batTypeNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::batTypeNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::batTypeNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get batTypeNameValidationFailureMessages():Array
    {
        if (model_internal::_batTypeNameValidationFailureMessages == null)
            model_internal::calculateBatTypeNameIsValid();

        return _batTypeNameValidationFailureMessages;
    }

    model_internal function set batTypeNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_batTypeNameValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_batTypeNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "batTypeNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get Y2008Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2007Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get batPwrNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get batPwrNameValidator() : StyleValidator
    {
        return model_internal::_batPwrNameValidator;
    }

    model_internal function set _batPwrNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_batPwrNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_batPwrNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "batPwrNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get batPwrNameIsValid():Boolean
    {
        if (!model_internal::_batPwrNameIsValidCacheInitialized)
        {
            model_internal::calculateBatPwrNameIsValid();
        }

        return model_internal::_batPwrNameIsValid;
    }

    model_internal function calculateBatPwrNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_batPwrNameValidator.validate(model_internal::_instance.batPwrName)
        model_internal::_batPwrNameIsValid_der = (valRes.results == null);
        model_internal::_batPwrNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::batPwrNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::batPwrNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get batPwrNameValidationFailureMessages():Array
    {
        if (model_internal::_batPwrNameValidationFailureMessages == null)
            model_internal::calculateBatPwrNameIsValid();

        return _batPwrNameValidationFailureMessages;
    }

    model_internal function set batPwrNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_batPwrNameValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_batPwrNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "batPwrNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get Y2006Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2005Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2010Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get sessionIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get deviceNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get deviceNameValidator() : StyleValidator
    {
        return model_internal::_deviceNameValidator;
    }

    model_internal function set _deviceNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_deviceNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_deviceNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deviceNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get deviceNameIsValid():Boolean
    {
        if (!model_internal::_deviceNameIsValidCacheInitialized)
        {
            model_internal::calculateDeviceNameIsValid();
        }

        return model_internal::_deviceNameIsValid;
    }

    model_internal function calculateDeviceNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_deviceNameValidator.validate(model_internal::_instance.deviceName)
        model_internal::_deviceNameIsValid_der = (valRes.results == null);
        model_internal::_deviceNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::deviceNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::deviceNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get deviceNameValidationFailureMessages():Array
    {
        if (model_internal::_deviceNameValidationFailureMessages == null)
            model_internal::calculateDeviceNameIsValid();

        return _deviceNameValidationFailureMessages;
    }

    model_internal function set deviceNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_deviceNameValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_deviceNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deviceNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get scenarioIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2009Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("countryName"):
            {
                return countryNameValidationFailureMessages;
            }
            case("batTypeName"):
            {
                return batTypeNameValidationFailureMessages;
            }
            case("batPwrName"):
            {
                return batPwrNameValidationFailureMessages;
            }
            case("deviceName"):
            {
                return deviceNameValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
