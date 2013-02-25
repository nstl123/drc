
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
internal class _GEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("Y2004", "indicatorID", "indiName", "sessionID", "Y2006", "countryID", "scenarioID", "Y2005", "cntryName");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("Y2004", "indicatorID", "indiName", "sessionID", "Y2006", "countryID", "scenarioID", "Y2005", "cntryName");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("Y2004", "indicatorID", "indiName", "sessionID", "Y2006", "countryID", "scenarioID", "Y2005", "cntryName");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("Y2004", "indicatorID", "indiName", "sessionID", "Y2006", "countryID", "scenarioID", "Y2005", "cntryName");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "G";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _indiNameIsValid:Boolean;
    model_internal var _indiNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _indiNameIsValidCacheInitialized:Boolean = false;
    model_internal var _indiNameValidationFailureMessages:Array;
    
    model_internal var _cntryNameIsValid:Boolean;
    model_internal var _cntryNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _cntryNameIsValidCacheInitialized:Boolean = false;
    model_internal var _cntryNameValidationFailureMessages:Array;

    model_internal var _instance:_Super_G;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _GEntityMetadata(value : _Super_G)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["Y2004"] = new Array();
            model_internal::dependentsOnMap["indicatorID"] = new Array();
            model_internal::dependentsOnMap["indiName"] = new Array();
            model_internal::dependentsOnMap["sessionID"] = new Array();
            model_internal::dependentsOnMap["Y2006"] = new Array();
            model_internal::dependentsOnMap["countryID"] = new Array();
            model_internal::dependentsOnMap["scenarioID"] = new Array();
            model_internal::dependentsOnMap["Y2005"] = new Array();
            model_internal::dependentsOnMap["cntryName"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
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
            throw new Error(propertyName + " is not a data property of entity G");  
            
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
            throw new Error(propertyName + " is not a collection property of entity G");  

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
            throw new Error(propertyName + " does not exist for entity G");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity G");
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
            throw new Error(propertyName + " does not exist for entity G");
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
    public function get isIndicatorIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIndiNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSessionIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2006Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCountryIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isScenarioIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2005Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCntryNameAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
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
    public function get Y2004Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get indicatorIDStyle():com.adobe.fiber.styles.Style
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
    public function get sessionIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2006Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get countryIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get scenarioIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2005Style():com.adobe.fiber.styles.Style
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
