
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
internal class _AEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("unit", "isOutputIndicator", "hasSplitByDevices", "hasSplitByTypes", "hierarchy", "hasTimeSeries", "comments", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen", "Y2013", "Y2004", "Y2012", "pwrTypeID", "indicatorID", "Y2015", "indiName", "Y2014", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2011", "Y2010", "sessionID", "scenarioID", "Y2009", "cntryName", "batTypeID");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("unit", "isOutputIndicator", "hasSplitByDevices", "hasSplitByTypes", "hierarchy", "hasTimeSeries", "comments", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen", "Y2013", "Y2004", "Y2012", "pwrTypeID", "indicatorID", "Y2015", "indiName", "Y2014", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2011", "Y2010", "sessionID", "scenarioID", "Y2009", "cntryName", "batTypeID");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("unit", "isOutputIndicator", "hasSplitByDevices", "hasSplitByTypes", "hierarchy", "hasTimeSeries", "comments", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen", "Y2013", "Y2004", "Y2012", "pwrTypeID", "indicatorID", "Y2015", "indiName", "Y2014", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2011", "Y2010", "sessionID", "scenarioID", "Y2009", "cntryName", "batTypeID");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("unit", "isOutputIndicator", "hasSplitByDevices", "hasSplitByTypes", "hierarchy", "hasTimeSeries", "comments", "region", "id", "pwr_RCR", "segment1", "battery_size", "segment2", "avg_number", "isRegion", "pwr_DPP", "shortName", "namen", "Y2013", "Y2004", "Y2012", "pwrTypeID", "indicatorID", "Y2015", "indiName", "Y2014", "Y2008", "Y2007", "countryID", "Y2006", "deviceID", "Y2005", "Y2011", "Y2010", "sessionID", "scenarioID", "Y2009", "cntryName", "batTypeID");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "A";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _unitIsValid:Boolean;
    model_internal var _unitValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _unitIsValidCacheInitialized:Boolean = false;
    model_internal var _unitValidationFailureMessages:Array;
    
    model_internal var _hierarchyIsValid:Boolean;
    model_internal var _hierarchyValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _hierarchyIsValidCacheInitialized:Boolean = false;
    model_internal var _hierarchyValidationFailureMessages:Array;
    
    model_internal var _commentsIsValid:Boolean;
    model_internal var _commentsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _commentsIsValidCacheInitialized:Boolean = false;
    model_internal var _commentsValidationFailureMessages:Array;
    
    model_internal var _shortNameIsValid:Boolean;
    model_internal var _shortNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _shortNameIsValidCacheInitialized:Boolean = false;
    model_internal var _shortNameValidationFailureMessages:Array;
    
    model_internal var _namenIsValid:Boolean;
    model_internal var _namenValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _namenIsValidCacheInitialized:Boolean = false;
    model_internal var _namenValidationFailureMessages:Array;
    
    model_internal var _indiNameIsValid:Boolean;
    model_internal var _indiNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _indiNameIsValidCacheInitialized:Boolean = false;
    model_internal var _indiNameValidationFailureMessages:Array;
    
    model_internal var _cntryNameIsValid:Boolean;
    model_internal var _cntryNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _cntryNameIsValidCacheInitialized:Boolean = false;
    model_internal var _cntryNameValidationFailureMessages:Array;

    model_internal var _instance:_Super_A;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _AEntityMetadata(value : _Super_A)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["unit"] = new Array();
            model_internal::dependentsOnMap["isOutputIndicator"] = new Array();
            model_internal::dependentsOnMap["hasSplitByDevices"] = new Array();
            model_internal::dependentsOnMap["hasSplitByTypes"] = new Array();
            model_internal::dependentsOnMap["hierarchy"] = new Array();
            model_internal::dependentsOnMap["hasTimeSeries"] = new Array();
            model_internal::dependentsOnMap["comments"] = new Array();
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
            model_internal::dependentsOnMap["Y2013"] = new Array();
            model_internal::dependentsOnMap["Y2004"] = new Array();
            model_internal::dependentsOnMap["Y2012"] = new Array();
            model_internal::dependentsOnMap["pwrTypeID"] = new Array();
            model_internal::dependentsOnMap["indicatorID"] = new Array();
            model_internal::dependentsOnMap["Y2015"] = new Array();
            model_internal::dependentsOnMap["indiName"] = new Array();
            model_internal::dependentsOnMap["Y2014"] = new Array();
            model_internal::dependentsOnMap["Y2008"] = new Array();
            model_internal::dependentsOnMap["Y2007"] = new Array();
            model_internal::dependentsOnMap["countryID"] = new Array();
            model_internal::dependentsOnMap["Y2006"] = new Array();
            model_internal::dependentsOnMap["deviceID"] = new Array();
            model_internal::dependentsOnMap["Y2005"] = new Array();
            model_internal::dependentsOnMap["Y2011"] = new Array();
            model_internal::dependentsOnMap["Y2010"] = new Array();
            model_internal::dependentsOnMap["sessionID"] = new Array();
            model_internal::dependentsOnMap["scenarioID"] = new Array();
            model_internal::dependentsOnMap["Y2009"] = new Array();
            model_internal::dependentsOnMap["cntryName"] = new Array();
            model_internal::dependentsOnMap["batTypeID"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_unitValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForUnit);
        model_internal::_unitValidator.required = true;
        model_internal::_unitValidator.requiredFieldError = "unit is required";
        //model_internal::_unitValidator.source = model_internal::_instance;
        //model_internal::_unitValidator.property = "unit";
        model_internal::_hierarchyValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForHierarchy);
        model_internal::_hierarchyValidator.required = true;
        model_internal::_hierarchyValidator.requiredFieldError = "hierarchy is required";
        //model_internal::_hierarchyValidator.source = model_internal::_instance;
        //model_internal::_hierarchyValidator.property = "hierarchy";
        model_internal::_commentsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForComments);
        model_internal::_commentsValidator.required = true;
        model_internal::_commentsValidator.requiredFieldError = "comments is required";
        //model_internal::_commentsValidator.source = model_internal::_instance;
        //model_internal::_commentsValidator.property = "comments";
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
        model_internal::_indiNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIndiName);
        model_internal::_indiNameValidator.required = true;
        model_internal::_indiNameValidator.requiredFieldError = "indiName is required";
        //model_internal::_indiNameValidator.source = model_internal::_instance;
        //model_internal::_indiNameValidator.property = "indiName";
        model_internal::_cntryNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCntryName);
        model_internal::_cntryNameValidator.required = true;
        model_internal::_cntryNameValidator.requiredFieldError = "cntryName is required";
        //model_internal::_cntryNameValidator.source = model_internal::_instance;
        //model_internal::_cntryNameValidator.property = "cntryName";
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
            throw new Error(propertyName + " is not a data property of entity A");  
            
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
            throw new Error(propertyName + " is not a collection property of entity A");  

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
            throw new Error(propertyName + " does not exist for entity A");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity A");
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
            throw new Error(propertyName + " does not exist for entity A");
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
    public function get isUnitAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIsOutputIndicatorAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isHasSplitByDevicesAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isHasSplitByTypesAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isHierarchyAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isHasTimeSeriesAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCommentsAvailable():Boolean
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

    [Bindable(event="propertyChange")]
    public function get isY2013Available():Boolean
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
    public function get isPwrTypeIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIndicatorIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2015Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIndiNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2014Available():Boolean
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
    public function get isY2011Available():Boolean
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
    public function get isCntryNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBatTypeIDAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnUnit():void
    {
        if (model_internal::_unitIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfUnit = null;
            model_internal::calculateUnitIsValid();
        }
    }
    public function invalidateDependentOnHierarchy():void
    {
        if (model_internal::_hierarchyIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfHierarchy = null;
            model_internal::calculateHierarchyIsValid();
        }
    }
    public function invalidateDependentOnComments():void
    {
        if (model_internal::_commentsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfComments = null;
            model_internal::calculateCommentsIsValid();
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
    public function invalidateDependentOnIndiName():void
    {
        if (model_internal::_indiNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIndiName = null;
            model_internal::calculateIndiNameIsValid();
        }
    }
    public function invalidateDependentOnCntryName():void
    {
        if (model_internal::_cntryNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfCntryName = null;
            model_internal::calculateCntryNameIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get unitStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get unitValidator() : StyleValidator
    {
        return model_internal::_unitValidator;
    }

    model_internal function set _unitIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_unitIsValid;         
        if (oldValue !== value)
        {
            model_internal::_unitIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unitIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get unitIsValid():Boolean
    {
        if (!model_internal::_unitIsValidCacheInitialized)
        {
            model_internal::calculateUnitIsValid();
        }

        return model_internal::_unitIsValid;
    }

    model_internal function calculateUnitIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_unitValidator.validate(model_internal::_instance.unit)
        model_internal::_unitIsValid_der = (valRes.results == null);
        model_internal::_unitIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::unitValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::unitValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get unitValidationFailureMessages():Array
    {
        if (model_internal::_unitValidationFailureMessages == null)
            model_internal::calculateUnitIsValid();

        return _unitValidationFailureMessages;
    }

    model_internal function set unitValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_unitValidationFailureMessages;

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
            model_internal::_unitValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unitValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get isOutputIndicatorStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get hasSplitByDevicesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get hasSplitByTypesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get hierarchyStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get hierarchyValidator() : StyleValidator
    {
        return model_internal::_hierarchyValidator;
    }

    model_internal function set _hierarchyIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_hierarchyIsValid;         
        if (oldValue !== value)
        {
            model_internal::_hierarchyIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hierarchyIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get hierarchyIsValid():Boolean
    {
        if (!model_internal::_hierarchyIsValidCacheInitialized)
        {
            model_internal::calculateHierarchyIsValid();
        }

        return model_internal::_hierarchyIsValid;
    }

    model_internal function calculateHierarchyIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_hierarchyValidator.validate(model_internal::_instance.hierarchy)
        model_internal::_hierarchyIsValid_der = (valRes.results == null);
        model_internal::_hierarchyIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::hierarchyValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::hierarchyValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get hierarchyValidationFailureMessages():Array
    {
        if (model_internal::_hierarchyValidationFailureMessages == null)
            model_internal::calculateHierarchyIsValid();

        return _hierarchyValidationFailureMessages;
    }

    model_internal function set hierarchyValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_hierarchyValidationFailureMessages;

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
            model_internal::_hierarchyValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hierarchyValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get hasTimeSeriesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get commentsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get commentsValidator() : StyleValidator
    {
        return model_internal::_commentsValidator;
    }

    model_internal function set _commentsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_commentsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_commentsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get commentsIsValid():Boolean
    {
        if (!model_internal::_commentsIsValidCacheInitialized)
        {
            model_internal::calculateCommentsIsValid();
        }

        return model_internal::_commentsIsValid;
    }

    model_internal function calculateCommentsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_commentsValidator.validate(model_internal::_instance.comments)
        model_internal::_commentsIsValid_der = (valRes.results == null);
        model_internal::_commentsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::commentsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::commentsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get commentsValidationFailureMessages():Array
    {
        if (model_internal::_commentsValidationFailureMessages == null)
            model_internal::calculateCommentsIsValid();

        return _commentsValidationFailureMessages;
    }

    model_internal function set commentsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_commentsValidationFailureMessages;

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
            model_internal::_commentsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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

    [Bindable(event="propertyChange")]   
    public function get Y2013Style():com.adobe.fiber.styles.Style
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
    public function get pwrTypeIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get indicatorIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2015Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get indiNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get indiNameValidator() : StyleValidator
    {
        return model_internal::_indiNameValidator;
    }

    model_internal function set _indiNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_indiNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_indiNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indiNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get indiNameIsValid():Boolean
    {
        if (!model_internal::_indiNameIsValidCacheInitialized)
        {
            model_internal::calculateIndiNameIsValid();
        }

        return model_internal::_indiNameIsValid;
    }

    model_internal function calculateIndiNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_indiNameValidator.validate(model_internal::_instance.indiName)
        model_internal::_indiNameIsValid_der = (valRes.results == null);
        model_internal::_indiNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::indiNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::indiNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get indiNameValidationFailureMessages():Array
    {
        if (model_internal::_indiNameValidationFailureMessages == null)
            model_internal::calculateIndiNameIsValid();

        return _indiNameValidationFailureMessages;
    }

    model_internal function set indiNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_indiNameValidationFailureMessages;

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
            model_internal::_indiNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indiNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get Y2014Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
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
    public function get Y2011Style():com.adobe.fiber.styles.Style
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
    public function get cntryNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get cntryNameValidator() : StyleValidator
    {
        return model_internal::_cntryNameValidator;
    }

    model_internal function set _cntryNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_cntryNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_cntryNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cntryNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get cntryNameIsValid():Boolean
    {
        if (!model_internal::_cntryNameIsValidCacheInitialized)
        {
            model_internal::calculateCntryNameIsValid();
        }

        return model_internal::_cntryNameIsValid;
    }

    model_internal function calculateCntryNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_cntryNameValidator.validate(model_internal::_instance.cntryName)
        model_internal::_cntryNameIsValid_der = (valRes.results == null);
        model_internal::_cntryNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::cntryNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::cntryNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get cntryNameValidationFailureMessages():Array
    {
        if (model_internal::_cntryNameValidationFailureMessages == null)
            model_internal::calculateCntryNameIsValid();

        return _cntryNameValidationFailureMessages;
    }

    model_internal function set cntryNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_cntryNameValidationFailureMessages;

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
            model_internal::_cntryNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cntryNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get batTypeIDStyle():com.adobe.fiber.styles.Style
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
            case("unit"):
            {
                return unitValidationFailureMessages;
            }
            case("hierarchy"):
            {
                return hierarchyValidationFailureMessages;
            }
            case("comments"):
            {
                return commentsValidationFailureMessages;
            }
            case("shortName"):
            {
                return shortNameValidationFailureMessages;
            }
            case("namen"):
            {
                return namenValidationFailureMessages;
            }
            case("indiName"):
            {
                return indiNameValidationFailureMessages;
            }
            case("cntryName"):
            {
                return cntryNameValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
