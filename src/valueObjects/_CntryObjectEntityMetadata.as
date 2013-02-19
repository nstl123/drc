
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
internal class _CntryObjectEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("Y2004", "Y2012", "indicatorID", "countryName", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("Y2004", "Y2012", "indicatorID", "countryName", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("Y2004", "Y2012", "indicatorID", "countryName", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("Y2004", "Y2012", "indicatorID", "countryName", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2010", "sessionID", "deviceName", "scenarioID", "Y2009", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "CntryObject";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _countryNameIsValid:Boolean;
    model_internal var _countryNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _countryNameIsValidCacheInitialized:Boolean = false;
    model_internal var _countryNameValidationFailureMessages:Array;
    
    model_internal var _deviceNameIsValid:Boolean;
    model_internal var _deviceNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _deviceNameIsValidCacheInitialized:Boolean = false;
    model_internal var _deviceNameValidationFailureMessages:Array;
    
    model_internal var _shortNameIsValid:Boolean;
    model_internal var _shortNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _shortNameIsValidCacheInitialized:Boolean = false;
    model_internal var _shortNameValidationFailureMessages:Array;
    
    model_internal var _namenIsValid:Boolean;
    model_internal var _namenValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _namenIsValidCacheInitialized:Boolean = false;
    model_internal var _namenValidationFailureMessages:Array;

    model_internal var _instance:_Super_CntryObject;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _CntryObjectEntityMetadata(value : _Super_CntryObject)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["Y2004"] = new Array();
            model_internal::dependentsOnMap["Y2012"] = new Array();
            model_internal::dependentsOnMap["indicatorID"] = new Array();
            model_internal::dependentsOnMap["countryName"] = new Array();
            model_internal::dependentsOnMap["Y2008"] = new Array();
            model_internal::dependentsOnMap["Y2007"] = new Array();
            model_internal::dependentsOnMap["countryID"] = new Array();
            model_internal::dependentsOnMap["Y2006"] = new Array();
            model_internal::dependentsOnMap["deviceID"] = new Array();
            model_internal::dependentsOnMap["Y2005"] = new Array();
            model_internal::dependentsOnMap["Y2010"] = new Array();
            model_internal::dependentsOnMap["sessionID"] = new Array();
            model_internal::dependentsOnMap["deviceName"] = new Array();
            model_internal::dependentsOnMap["scenarioID"] = new Array();
            model_internal::dependentsOnMap["Y2009"] = new Array();
            model_internal::dependentsOnMap["region"] = new Array();
            model_internal::dependentsOnMap["id"] = new Array();
            model_internal::dependentsOnMap["pwr_RCR"] = new Array();
            model_internal::dependentsOnMap["segment1"] = new Array();
            model_internal::dependentsOnMap["battery_size"] = new Array();
            model_internal::dependentsOnMap["segment2"] = new Array();
            model_internal::dependentsOnMap["avg_number"] = new Array();
            model_internal::dependentsOnMap["isRegion"] = new Array();
            model_internal::dependentsOnMap["pwr_DPP"] = new Array();
            model_internal::dependentsOnMap["shortName"] = new Array();
            model_internal::dependentsOnMap["namen"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_countryNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCountryName);
        model_internal::_countryNameValidator.required = true;
        model_internal::_countryNameValidator.requiredFieldError = "countryName is required";
        //model_internal::_countryNameValidator.source = model_internal::_instance;
        //model_internal::_countryNameValidator.property = "countryName";
        model_internal::_deviceNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDeviceName);
        model_internal::_deviceNameValidator.required = true;
        model_internal::_deviceNameValidator.requiredFieldError = "deviceName is required";
        //model_internal::_deviceNameValidator.source = model_internal::_instance;
        //model_internal::_deviceNameValidator.property = "deviceName";
        model_internal::_shortNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForShortName);
        model_internal::_shortNameValidator.required = true;
        model_internal::_shortNameValidator.requiredFieldError = "shortName is required";
        //model_internal::_shortNameValidator.source = model_internal::_instance;
        //model_internal::_shortNameValidator.property = "shortName";
        model_internal::_namenValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForNamen);
        model_internal::_namenValidator.required = true;
        model_internal::_namenValidator.requiredFieldError = "namen is required";
        //model_internal::_namenValidator.source = model_internal::_instance;
        //model_internal::_namenValidator.property = "namen";
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
            throw new Error(propertyName + " is not a data property of entity CntryObject");  
            
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
            throw new Error(propertyName + " is not a collection property of entity CntryObject");  

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
            throw new Error(propertyName + " does not exist for entity CntryObject");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity CntryObject");
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
            throw new Error(propertyName + " does not exist for entity CntryObject");
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
    public function get isIndicatorIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCountryNameAvailable():Boolean
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
    public function get isCountryIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2006Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDeviceIDAvailable():Boolean
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

    [Bindable(event="propertyChange")]
    public function get isRegionAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIdAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPwr_RCRAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSegment1Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBattery_sizeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSegment2Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isAvg_numberAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIsRegionAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPwr_DPPAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isShortNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isNamenAvailable():Boolean
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
    public function invalidateDependentOnDeviceName():void
    {
        if (model_internal::_deviceNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDeviceName = null;
            model_internal::calculateDeviceNameIsValid();
        }
    }
    public function invalidateDependentOnShortName():void
    {
        if (model_internal::_shortNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfShortName = null;
            model_internal::calculateShortNameIsValid();
        }
    }
    public function invalidateDependentOnNamen():void
    {
        if (model_internal::_namenIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfNamen = null;
            model_internal::calculateNamenIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
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
    public function get indicatorIDStyle():com.adobe.fiber.styles.Style
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
    public function get countryIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2006Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get deviceIDStyle():com.adobe.fiber.styles.Style
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

    [Bindable(event="propertyChange")]   
    public function get regionStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get pwr_RCRStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get segment1Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get battery_sizeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get segment2Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get avg_numberStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get isRegionStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get pwr_DPPStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get shortNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get shortNameValidator() : StyleValidator
    {
        return model_internal::_shortNameValidator;
    }

    model_internal function set _shortNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_shortNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_shortNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shortNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get shortNameIsValid():Boolean
    {
        if (!model_internal::_shortNameIsValidCacheInitialized)
        {
            model_internal::calculateShortNameIsValid();
        }

        return model_internal::_shortNameIsValid;
    }

    model_internal function calculateShortNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_shortNameValidator.validate(model_internal::_instance.shortName)
        model_internal::_shortNameIsValid_der = (valRes.results == null);
        model_internal::_shortNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::shortNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::shortNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get shortNameValidationFailureMessages():Array
    {
        if (model_internal::_shortNameValidationFailureMessages == null)
            model_internal::calculateShortNameIsValid();

        return _shortNameValidationFailureMessages;
    }

    model_internal function set shortNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_shortNameValidationFailureMessages;

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
            model_internal::_shortNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shortNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get namenStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get namenValidator() : StyleValidator
    {
        return model_internal::_namenValidator;
    }

    model_internal function set _namenIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_namenIsValid;         
        if (oldValue !== value)
        {
            model_internal::_namenIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "namenIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get namenIsValid():Boolean
    {
        if (!model_internal::_namenIsValidCacheInitialized)
        {
            model_internal::calculateNamenIsValid();
        }

        return model_internal::_namenIsValid;
    }

    model_internal function calculateNamenIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_namenValidator.validate(model_internal::_instance.namen)
        model_internal::_namenIsValid_der = (valRes.results == null);
        model_internal::_namenIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::namenValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::namenValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get namenValidationFailureMessages():Array
    {
        if (model_internal::_namenValidationFailureMessages == null)
            model_internal::calculateNamenIsValid();

        return _namenValidationFailureMessages;
    }

    model_internal function set namenValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_namenValidationFailureMessages;

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
            model_internal::_namenValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "namenValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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
            case("deviceName"):
            {
                return deviceNameValidationFailureMessages;
            }
            case("shortName"):
            {
                return shortNameValidationFailureMessages;
            }
            case("namen"):
            {
                return namenValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
