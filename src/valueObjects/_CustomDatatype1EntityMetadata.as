
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
internal class _CustomDatatype1EntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("indicatorID", "sessionID", "scenarioID", "countryID", "Y2005", "unitID", "Y2010");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("indicatorID", "sessionID", "scenarioID", "countryID", "Y2005", "unitID", "Y2010");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("indicatorID", "sessionID", "scenarioID", "countryID", "Y2005", "unitID", "Y2010");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("indicatorID", "sessionID", "scenarioID", "countryID", "Y2005", "unitID", "Y2010");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "CustomDatatype1";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _indicatorIDIsValid:Boolean;
    model_internal var _indicatorIDValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _indicatorIDIsValidCacheInitialized:Boolean = false;
    model_internal var _indicatorIDValidationFailureMessages:Array;
    
    model_internal var _sessionIDIsValid:Boolean;
    model_internal var _sessionIDValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _sessionIDIsValidCacheInitialized:Boolean = false;
    model_internal var _sessionIDValidationFailureMessages:Array;
    
    model_internal var _scenarioIDIsValid:Boolean;
    model_internal var _scenarioIDValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _scenarioIDIsValidCacheInitialized:Boolean = false;
    model_internal var _scenarioIDValidationFailureMessages:Array;
    
    model_internal var _countryIDIsValid:Boolean;
    model_internal var _countryIDValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _countryIDIsValidCacheInitialized:Boolean = false;
    model_internal var _countryIDValidationFailureMessages:Array;
    
    model_internal var _Y2005IsValid:Boolean;
    model_internal var _Y2005Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _Y2005IsValidCacheInitialized:Boolean = false;
    model_internal var _Y2005ValidationFailureMessages:Array;
    
    model_internal var _unitIDIsValid:Boolean;
    model_internal var _unitIDValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _unitIDIsValidCacheInitialized:Boolean = false;
    model_internal var _unitIDValidationFailureMessages:Array;
    
    model_internal var _Y2010IsValid:Boolean;
    model_internal var _Y2010Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _Y2010IsValidCacheInitialized:Boolean = false;
    model_internal var _Y2010ValidationFailureMessages:Array;

    model_internal var _instance:_Super_CustomDatatype1;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _CustomDatatype1EntityMetadata(value : _Super_CustomDatatype1)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["indicatorID"] = new Array();
            model_internal::dependentsOnMap["sessionID"] = new Array();
            model_internal::dependentsOnMap["scenarioID"] = new Array();
            model_internal::dependentsOnMap["countryID"] = new Array();
            model_internal::dependentsOnMap["Y2005"] = new Array();
            model_internal::dependentsOnMap["unitID"] = new Array();
            model_internal::dependentsOnMap["Y2010"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_indicatorIDValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIndicatorID);
        model_internal::_indicatorIDValidator.required = true;
        model_internal::_indicatorIDValidator.requiredFieldError = "indicatorID is required";
        //model_internal::_indicatorIDValidator.source = model_internal::_instance;
        //model_internal::_indicatorIDValidator.property = "indicatorID";
        model_internal::_sessionIDValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForSessionID);
        model_internal::_sessionIDValidator.required = true;
        model_internal::_sessionIDValidator.requiredFieldError = "sessionID is required";
        //model_internal::_sessionIDValidator.source = model_internal::_instance;
        //model_internal::_sessionIDValidator.property = "sessionID";
        model_internal::_scenarioIDValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForScenarioID);
        model_internal::_scenarioIDValidator.required = true;
        model_internal::_scenarioIDValidator.requiredFieldError = "scenarioID is required";
        //model_internal::_scenarioIDValidator.source = model_internal::_instance;
        //model_internal::_scenarioIDValidator.property = "scenarioID";
        model_internal::_countryIDValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCountryID);
        model_internal::_countryIDValidator.required = true;
        model_internal::_countryIDValidator.requiredFieldError = "countryID is required";
        //model_internal::_countryIDValidator.source = model_internal::_instance;
        //model_internal::_countryIDValidator.property = "countryID";
        model_internal::_Y2005Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForY2005);
        model_internal::_Y2005Validator.required = true;
        model_internal::_Y2005Validator.requiredFieldError = "Y2005 is required";
        //model_internal::_Y2005Validator.source = model_internal::_instance;
        //model_internal::_Y2005Validator.property = "Y2005";
        model_internal::_unitIDValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForUnitID);
        model_internal::_unitIDValidator.required = true;
        model_internal::_unitIDValidator.requiredFieldError = "unitID is required";
        //model_internal::_unitIDValidator.source = model_internal::_instance;
        //model_internal::_unitIDValidator.property = "unitID";
        model_internal::_Y2010Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForY2010);
        model_internal::_Y2010Validator.required = true;
        model_internal::_Y2010Validator.requiredFieldError = "Y2010 is required";
        //model_internal::_Y2010Validator.source = model_internal::_instance;
        //model_internal::_Y2010Validator.property = "Y2010";
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
            throw new Error(propertyName + " is not a data property of entity CustomDatatype1");  
            
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
            throw new Error(propertyName + " is not a collection property of entity CustomDatatype1");  

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
            throw new Error(propertyName + " does not exist for entity CustomDatatype1");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity CustomDatatype1");
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
            throw new Error(propertyName + " does not exist for entity CustomDatatype1");
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
    public function get isIndicatorIDAvailable():Boolean
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
    public function get isCountryIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2005Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isUnitIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2010Available():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnIndicatorID():void
    {
        if (model_internal::_indicatorIDIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIndicatorID = null;
            model_internal::calculateIndicatorIDIsValid();
        }
    }
    public function invalidateDependentOnSessionID():void
    {
        if (model_internal::_sessionIDIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfSessionID = null;
            model_internal::calculateSessionIDIsValid();
        }
    }
    public function invalidateDependentOnScenarioID():void
    {
        if (model_internal::_scenarioIDIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfScenarioID = null;
            model_internal::calculateScenarioIDIsValid();
        }
    }
    public function invalidateDependentOnCountryID():void
    {
        if (model_internal::_countryIDIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfCountryID = null;
            model_internal::calculateCountryIDIsValid();
        }
    }
    public function invalidateDependentOnY2005():void
    {
        if (model_internal::_Y2005IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfY2005 = null;
            model_internal::calculateY2005IsValid();
        }
    }
    public function invalidateDependentOnUnitID():void
    {
        if (model_internal::_unitIDIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfUnitID = null;
            model_internal::calculateUnitIDIsValid();
        }
    }
    public function invalidateDependentOnY2010():void
    {
        if (model_internal::_Y2010IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfY2010 = null;
            model_internal::calculateY2010IsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get indicatorIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get indicatorIDValidator() : StyleValidator
    {
        return model_internal::_indicatorIDValidator;
    }

    model_internal function set _indicatorIDIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_indicatorIDIsValid;         
        if (oldValue !== value)
        {
            model_internal::_indicatorIDIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indicatorIDIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get indicatorIDIsValid():Boolean
    {
        if (!model_internal::_indicatorIDIsValidCacheInitialized)
        {
            model_internal::calculateIndicatorIDIsValid();
        }

        return model_internal::_indicatorIDIsValid;
    }

    model_internal function calculateIndicatorIDIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_indicatorIDValidator.validate(model_internal::_instance.indicatorID)
        model_internal::_indicatorIDIsValid_der = (valRes.results == null);
        model_internal::_indicatorIDIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::indicatorIDValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::indicatorIDValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get indicatorIDValidationFailureMessages():Array
    {
        if (model_internal::_indicatorIDValidationFailureMessages == null)
            model_internal::calculateIndicatorIDIsValid();

        return _indicatorIDValidationFailureMessages;
    }

    model_internal function set indicatorIDValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_indicatorIDValidationFailureMessages;

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
            model_internal::_indicatorIDValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indicatorIDValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get sessionIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get sessionIDValidator() : StyleValidator
    {
        return model_internal::_sessionIDValidator;
    }

    model_internal function set _sessionIDIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_sessionIDIsValid;         
        if (oldValue !== value)
        {
            model_internal::_sessionIDIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sessionIDIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get sessionIDIsValid():Boolean
    {
        if (!model_internal::_sessionIDIsValidCacheInitialized)
        {
            model_internal::calculateSessionIDIsValid();
        }

        return model_internal::_sessionIDIsValid;
    }

    model_internal function calculateSessionIDIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_sessionIDValidator.validate(model_internal::_instance.sessionID)
        model_internal::_sessionIDIsValid_der = (valRes.results == null);
        model_internal::_sessionIDIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::sessionIDValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::sessionIDValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get sessionIDValidationFailureMessages():Array
    {
        if (model_internal::_sessionIDValidationFailureMessages == null)
            model_internal::calculateSessionIDIsValid();

        return _sessionIDValidationFailureMessages;
    }

    model_internal function set sessionIDValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_sessionIDValidationFailureMessages;

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
            model_internal::_sessionIDValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sessionIDValidationFailureMessages", oldValue, value));
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

    public function get scenarioIDValidator() : StyleValidator
    {
        return model_internal::_scenarioIDValidator;
    }

    model_internal function set _scenarioIDIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_scenarioIDIsValid;         
        if (oldValue !== value)
        {
            model_internal::_scenarioIDIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scenarioIDIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get scenarioIDIsValid():Boolean
    {
        if (!model_internal::_scenarioIDIsValidCacheInitialized)
        {
            model_internal::calculateScenarioIDIsValid();
        }

        return model_internal::_scenarioIDIsValid;
    }

    model_internal function calculateScenarioIDIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_scenarioIDValidator.validate(model_internal::_instance.scenarioID)
        model_internal::_scenarioIDIsValid_der = (valRes.results == null);
        model_internal::_scenarioIDIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::scenarioIDValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::scenarioIDValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get scenarioIDValidationFailureMessages():Array
    {
        if (model_internal::_scenarioIDValidationFailureMessages == null)
            model_internal::calculateScenarioIDIsValid();

        return _scenarioIDValidationFailureMessages;
    }

    model_internal function set scenarioIDValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_scenarioIDValidationFailureMessages;

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
            model_internal::_scenarioIDValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scenarioIDValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get countryIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get countryIDValidator() : StyleValidator
    {
        return model_internal::_countryIDValidator;
    }

    model_internal function set _countryIDIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_countryIDIsValid;         
        if (oldValue !== value)
        {
            model_internal::_countryIDIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryIDIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get countryIDIsValid():Boolean
    {
        if (!model_internal::_countryIDIsValidCacheInitialized)
        {
            model_internal::calculateCountryIDIsValid();
        }

        return model_internal::_countryIDIsValid;
    }

    model_internal function calculateCountryIDIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_countryIDValidator.validate(model_internal::_instance.countryID)
        model_internal::_countryIDIsValid_der = (valRes.results == null);
        model_internal::_countryIDIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::countryIDValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::countryIDValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get countryIDValidationFailureMessages():Array
    {
        if (model_internal::_countryIDValidationFailureMessages == null)
            model_internal::calculateCountryIDIsValid();

        return _countryIDValidationFailureMessages;
    }

    model_internal function set countryIDValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_countryIDValidationFailureMessages;

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
            model_internal::_countryIDValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryIDValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get Y2005Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get Y2005Validator() : StyleValidator
    {
        return model_internal::_Y2005Validator;
    }

    model_internal function set _Y2005IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_Y2005IsValid;         
        if (oldValue !== value)
        {
            model_internal::_Y2005IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2005IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get Y2005IsValid():Boolean
    {
        if (!model_internal::_Y2005IsValidCacheInitialized)
        {
            model_internal::calculateY2005IsValid();
        }

        return model_internal::_Y2005IsValid;
    }

    model_internal function calculateY2005IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_Y2005Validator.validate(model_internal::_instance.Y2005)
        model_internal::_Y2005IsValid_der = (valRes.results == null);
        model_internal::_Y2005IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::Y2005ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::Y2005ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get Y2005ValidationFailureMessages():Array
    {
        if (model_internal::_Y2005ValidationFailureMessages == null)
            model_internal::calculateY2005IsValid();

        return _Y2005ValidationFailureMessages;
    }

    model_internal function set Y2005ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_Y2005ValidationFailureMessages;

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
            model_internal::_Y2005ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2005ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get unitIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get unitIDValidator() : StyleValidator
    {
        return model_internal::_unitIDValidator;
    }

    model_internal function set _unitIDIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_unitIDIsValid;         
        if (oldValue !== value)
        {
            model_internal::_unitIDIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unitIDIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get unitIDIsValid():Boolean
    {
        if (!model_internal::_unitIDIsValidCacheInitialized)
        {
            model_internal::calculateUnitIDIsValid();
        }

        return model_internal::_unitIDIsValid;
    }

    model_internal function calculateUnitIDIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_unitIDValidator.validate(model_internal::_instance.unitID)
        model_internal::_unitIDIsValid_der = (valRes.results == null);
        model_internal::_unitIDIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::unitIDValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::unitIDValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get unitIDValidationFailureMessages():Array
    {
        if (model_internal::_unitIDValidationFailureMessages == null)
            model_internal::calculateUnitIDIsValid();

        return _unitIDValidationFailureMessages;
    }

    model_internal function set unitIDValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_unitIDValidationFailureMessages;

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
            model_internal::_unitIDValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unitIDValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get Y2010Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get Y2010Validator() : StyleValidator
    {
        return model_internal::_Y2010Validator;
    }

    model_internal function set _Y2010IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_Y2010IsValid;         
        if (oldValue !== value)
        {
            model_internal::_Y2010IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2010IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get Y2010IsValid():Boolean
    {
        if (!model_internal::_Y2010IsValidCacheInitialized)
        {
            model_internal::calculateY2010IsValid();
        }

        return model_internal::_Y2010IsValid;
    }

    model_internal function calculateY2010IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_Y2010Validator.validate(model_internal::_instance.Y2010)
        model_internal::_Y2010IsValid_der = (valRes.results == null);
        model_internal::_Y2010IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::Y2010ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::Y2010ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get Y2010ValidationFailureMessages():Array
    {
        if (model_internal::_Y2010ValidationFailureMessages == null)
            model_internal::calculateY2010IsValid();

        return _Y2010ValidationFailureMessages;
    }

    model_internal function set Y2010ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_Y2010ValidationFailureMessages;

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
            model_internal::_Y2010ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2010ValidationFailureMessages", oldValue, value));
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
            case("indicatorID"):
            {
                return indicatorIDValidationFailureMessages;
            }
            case("sessionID"):
            {
                return sessionIDValidationFailureMessages;
            }
            case("scenarioID"):
            {
                return scenarioIDValidationFailureMessages;
            }
            case("countryID"):
            {
                return countryIDValidationFailureMessages;
            }
            case("Y2005"):
            {
                return Y2005ValidationFailureMessages;
            }
            case("unitID"):
            {
                return unitIDValidationFailureMessages;
            }
            case("Y2010"):
            {
                return Y2010ValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
